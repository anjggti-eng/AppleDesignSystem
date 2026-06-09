import SwiftUI

// MARK: - DSLoadingIndicator

public enum DSLoadingStyle {
    case spinner
    case dots
    case pulse
    case progress
}

public struct DSLoadingIndicator: View {
    let style: DSLoadingStyle
    let color: Color
    let size: CGFloat

    public init(
        style: DSLoadingStyle = .spinner,
        color: Color = DSColor.System.blue,
        size: CGFloat = 24
    ) {
        self.style = style
        self.color = color
        self.size = size
    }

    public var body: some View {
        Group {
            switch style {
            case .spinner:
                spinnerView
            case .dots:
                dotsView
            case .pulse:
                pulseView
            case .progress:
                progressView
            }
        }
        .frame(width: size, height: size)
    }

    // MARK: - Spinner

    private var spinnerView: some View {
        ProgressView()
            .tint(color)
            .scaleEffect(size / 24)
    }

    // MARK: - Dots

    private var dotsView: some View {
        HStack(spacing: size * 0.15) {
            ForEach(0..<3, id: \.self) { index in
                Circle()
                    .fill(color)
                    .frame(width: size * 0.25, height: size * 0.25)
                    .scaleEffect(scale(for: index))
                    .animation(
                        .easeInOut(duration: 0.6)
                        .repeatForever()
                        .delay(Double(index) * 0.15),
                        value: scale(for: index)
                    )
            }
        }
    }

    private func scale(for index: Int) -> CGFloat {
        return 1.0
    }

    // MARK: - Pulse

    private var pulseView: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.3))
                .frame(width: size, height: size)

            Circle()
                .fill(color)
                .frame(width: size * 0.6, height: size * 0.6)
                .scaleEffect(pulseScale)
                .animation(
                    .easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true),
                    value: pulseScale
                )
        }
    }

    @State private var pulseScale: CGFloat = 0.8

    // MARK: - Progress

    private var progressView: some View {
        ProgressView(value: progress)
            .tint(color)
            .scaleEffect(size / 24)
            .animation(.linear(duration: 1), value: progress)
            .onAppear {
                progress = 1.0
            }
    }

    @State private var progress: Double = 0
}

// MARK: - DS Loading Overlay

public struct DSLoadingOverlay: View {
    let isLoading: Bool
    let message: String?

    public init(isLoading: Bool, message: String? = nil) {
        self.isLoading = isLoading
        self.message = message
    }

    public var body: some View {
        if isLoading {
            ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                VStack(spacing: DSSpacing.md) {
                    DSLoadingIndicator(style: .spinner, size: 32)

                    if let message = message {
                        Text(message)
                            .dsTextStyle(.subheadline)
                            .foregroundStyle(.white)
                    }
                }
                .padding(DSSpacing.xl)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
            }
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.2), value: isLoading)
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 30) {
        DSLoadingIndicator(style: .spinner)
        DSLoadingIndicator(style: .dots)
        DSLoadingIndicator(style: .pulse)
        DSLoadingIndicator(style: .progress)
    }
    .padding()
}
