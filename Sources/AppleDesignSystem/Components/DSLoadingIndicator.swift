import SwiftUI

// MARK: - DSLoadingIndicator

public enum DSLoadingStyle {
    case spinner
    case dots
    case pulse
    case progress
    case shimmer
    case skeleton
}

public struct DSLoadingIndicator: View {
    let style: DSLoadingStyle
    let color: Color
    let size: CGFloat
    let text: String?

    public init(
        style: DSLoadingStyle = .spinner,
        color: Color = DSColor.System.blue,
        size: CGFloat = 24,
        text: String? = nil
    ) {
        self.style = style
        self.color = color
        self.size = size
        self.text = text
    }

    public var body: some View {
        VStack(spacing: DSSpacing.md) {
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
                case .shimmer:
                    shimmerView
                case .skeleton:
                    skeletonView
                }
            }
            .frame(width: size, height: size)

            if let text = text {
                Text(text)
                    .dsTextStyle(.subheadline)
                    .foregroundStyle(DSColor.Label.secondary)
                    .accessibilityLabel(text)
            }
        }
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

    @State private var dotScales: [CGFloat] = [1.0, 1.0, 1.0]

    private func scale(for index: Int) -> CGFloat {
        return dotScales.indices.contains(index) ? dotScales[index] : 1.0
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

    // MARK: - Shimmer

    private var shimmerView: some View {
        Rectangle()
            .fill(DSColor.Fill.secondary)
            .frame(height: size)
            .dsShimmer()
    }

    // MARK: - Skeleton

    private var skeletonView: some View {
        VStack(spacing: DSSpacing.sm) {
            RoundedRectangle(cornerRadius: 4)
                .fill(DSColor.Fill.secondary)
                .frame(height: 12)
                .dsShimmer()

            RoundedRectangle(cornerRadius: 4)
                .fill(DSColor.Fill.secondary)
                .frame(height: 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .dsShimmer()
        }
    }
}

// MARK: - DS Loading Overlay

public struct DSLoadingOverlay: View {
    let isLoading: Bool
    let message: String?
    let style: DSLoadingStyle

    public init(
        isLoading: Bool,
        message: String? = nil,
        style: DSLoadingStyle = .spinner
    ) {
        self.isLoading = isLoading
        self.message = message
        self.style = style
    }

    public var body: some View {
        if isLoading {
            ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                VStack(spacing: DSSpacing.md) {
                    DSLoadingIndicator(style: style, size: 32)

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
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text(message ?? "Carregando"))
        }
    }
}

// MARK: - DSNotificationBanner

public enum DSBannerStyle {
    case info, success, warning, error
}

public struct DSNotificationBanner: View {
    let style: DSBannerStyle
    let title: String
    let message: String?
    let icon: String?
    let duration: Double
    @Binding var isPresented: Bool

    @State private var offset: CGFloat = -100

    public init(
        style: DSBannerStyle = .info,
        title: String,
        message: String? = nil,
        icon: String? = nil,
        duration: Double = 3.0,
        isPresented: Binding<Bool>
    ) {
        self.style = style
        self.title = title
        self.message = message
        self.icon = icon
        self.duration = duration
        self._isPresented = isPresented
    }

    public var body: some View {
        VStack {
            if isPresented {
                HStack(spacing: DSSpacing.md) {
                    Image(systemName: icon ?? defaultIcon)
                        .font(.title3)
                        .foregroundStyle(bannerColor)
                        .accessibilityHidden(true)

                    VStack(alignment: .leading, spacing: DSSpacing.xs) {
                        Text(title)
                            .dsTextStyle(.subheadline)
                            .fontWeight(.semibold)

                        if let message = message {
                            Text(message)
                                .dsTextStyle(.caption)
                                .foregroundStyle(DSColor.Label.secondary)
                        }
                    }

                    Spacer()

                    Button(action: {
                        DSHaptics.impact(.light)
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            isPresented = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.caption)
                            .foregroundStyle(DSColor.Label.tertiary)
                    }
                    .accessibilityLabel("Fechar")
                }
                .padding(DSSpacing.md)
                .background(bannerBackground)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
                .dsShadow(DSShadow.lg)
                .padding(.horizontal, DSSpacing.lg)
                .offset(y: offset)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: offset)
                .onAppear {
                    withAnimation {
                        offset = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            isPresented = false
                        }
                    }
                }
            }

            Spacer()
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title). \(message ?? "")"))
    }

    private var defaultIcon: String {
        switch style {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }

    private var bannerColor: Color {
        switch style {
        case .info: return DSColor.System.blue
        case .success: return DSColor.System.green
        case .warning: return DSColor.System.orange
        case .error: return DSColor.System.red
        }
    }

    private var bannerBackground: some ShapeStyle {
        AnyShapeStyle(bannerColor.opacity(0.1))
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var showBanner = true

    return VStack {
        DSNotificationBanner(
            style: .success,
            title: "Sucesso!",
            message: "Seus dados foram salvos",
            isPresented: $showBanner
        )
    }
}
