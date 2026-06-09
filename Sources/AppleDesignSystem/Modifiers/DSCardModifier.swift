import SwiftUI

// MARK: - Card Modifier

public struct DSCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let shadow: ShadowStyle
    let padding: CGFloat

    public init(
        cornerRadius: CGFloat = DSRadius.lg,
        shadow: ShadowStyle = DSShadow.md,
        padding: CGFloat = DSSpacing.lg
    ) {
        self.cornerRadius = cornerRadius
        self.shadow = shadow
        self.padding = padding
    }

    public func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(DSMaterial.regular)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .dsShadow(shadow)
    }
}

extension View {
    public func dsCard(
        cornerRadius: CGFloat = DSRadius.lg,
        shadow: ShadowStyle = DSShadow.md,
        padding: CGFloat = DSSpacing.lg
    ) -> some View {
        modifier(DSCardModifier(cornerRadius: cornerRadius, shadow: shadow, padding: padding))
    }
}
