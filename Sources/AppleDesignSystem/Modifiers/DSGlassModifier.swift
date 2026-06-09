import SwiftUI

// MARK: - Glassmorphism Modifier

public struct DSGlassModifier: ViewModifier {
    let material: AnyShapeStyle
    let cornerRadius: CGFloat
    let strokeColor: Color
    let strokeWidth: CGFloat

    public init(
        material: AnyShapeStyle = DSMaterial.ultraThin,
        cornerRadius: CGFloat = DSRadius.lg,
        strokeColor: Color = .white.opacity(0.2),
        strokeWidth: CGFloat = 0.5
    ) {
        self.material = material
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }

    public func body(content: Content) -> some View {
        content
            .background(material)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(strokeColor, lineWidth: strokeWidth)
            )
    }
}

extension View {
    public func dsGlass(
        material: AnyShapeStyle = DSMaterial.ultraThin,
        cornerRadius: CGFloat = DSRadius.lg,
        strokeColor: Color = .white.opacity(0.2),
        strokeWidth: CGFloat = 0.5
    ) -> some View {
        modifier(DSGlassModifier(
            material: material,
            cornerRadius: cornerRadius,
            strokeColor: strokeColor,
            strokeWidth: strokeWidth
        ))
    }
}
