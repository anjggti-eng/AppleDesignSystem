import SwiftUI

// MARK: - Shimmer Modifier (Loading State)

public struct DSShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    let isActive: Bool

    public init(isActive: Bool = true) {
        self.isActive = isActive
    }

    public func body(content: Content) -> some View {
        content
            .overlay(
                isActive ? shimmerOverlay : nil
            )
    }

    private var shimmerOverlay: some View {
        GeometryReader { geometry in
            LinearGradient(
                stops: [
                    .init(color: .clear, location: max(0, phase - 0.3)),
                    .init(color: .white.opacity(0.4), location: phase),
                    .init(color: .clear, location: min(1, phase + 0.3))
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: geometry.size.width)
            .offset(x: -geometry.size.width)
            .offset(x: geometry.size.width * phase)
            .onAppear {
                guard isActive else { return }
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1.5
                }
            }
            .onChange(of: isActive) { _, newValue in
                if newValue {
                    phase = 0
                    withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        phase = 1.5
                    }
                }
            }
        }
        .clipShape(content.shape ?? RoundedRectangle(cornerRadius: DSRadius.lg))
    }
}

extension Shape {
    func clipShape(_ shape: some Shape) -> some Shape {
        self.clip(shape)
    }
}

extension View {
    public func dsShimmer(isActive: Bool = true) -> some View {
        modifier(DSShimmerModifier(isActive: isActive))
    }
}

// MARK: - Shimmer Placeholder

public struct DSShimmerPlaceholder: View {
    let width: CGFloat?
    let height: CGFloat
    let cornerRadius: CGFloat

    public init(
        width: CGFloat? = nil,
        height: CGFloat = 20,
        cornerRadius: CGFloat = DSRadius.sm
    ) {
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(DSColor.Fill.secondary)
            .frame(width: width, height: height)
            .dsShimmer()
    }
}
