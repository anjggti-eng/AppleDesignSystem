import SwiftUI

// MARK: - Material Tokens

public enum DSMaterial {

    /// Ultra thin material - subtle blur
    public static let ultraThin = AnyShapeStyle(.ultraThinMaterial)

    /// Thin material - light blur
    public static let thin = AnyShapeStyle(.thinMaterial)

    /// Regular material - medium blur
    public static let regular = AnyShapeStyle(.regularMaterial)

    /// Thick material - heavy blur
    public static let thick = AnyShapeStyle(.thickMaterial)

    /// Ultra thick material - maximum blur
    public static let ultraThick = AnyShapeStyle(.ultraThickMaterial)

    // MARK: - Custom Materials

    /// Frosted glass with custom tint
    public static func frosted(tint: Color = .white.opacity(0.1)) -> AnyShapeStyle {
        AnyShapeStyle(.ultraThinMaterial)
    }

    /// Card material with subtle elevation
    public static var card: AnyShapeStyle {
        AnyShapeStyle(.regularMaterial)
    }

    /// Navigation bar material
    public static var navigationBar: AnyShapeStyle {
        AnyShapeStyle(.ultraThinMaterial)
    }
}

// MARK: - ViewModifier for Material

public struct MaterialModifier: ViewModifier {
    let material: AnyShapeStyle

    public func body(content: Content) -> some View {
        content
            .background(material)
    }
}

extension View {
    public func dsMaterial(_ material: AnyShapeStyle = DSMaterial.regular) -> some View {
        modifier(MaterialModifier(material: material))
    }
}
