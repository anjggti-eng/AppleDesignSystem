import SwiftUI

// MARK: - Shadow Tokens

public enum DSShadow {

    /// Small shadow: y=1, blur=2, opacity=0.05
    public static let sm = ShadowStyle(
        color: .black.opacity(0.05),
        x: 0,
        y: 1,
        blur: 2
    )

    /// Medium shadow: y=2, blur=8, opacity=0.1
    public static let md = ShadowStyle(
        color: .black.opacity(0.1),
        x: 0,
        y: 2,
        blur: 8
    )

    /// Large shadow: y=4, blur=16, opacity=0.15
    public static let lg = ShadowStyle(
        color: .black.opacity(0.15),
        x: 0,
        y: 4,
        blur: 16
    )

    /// Extra large shadow: y=8, blur=32, opacity=0.2
    public static let xl = ShadowStyle(
        color: .black.opacity(0.2),
        x: 0,
        y: 8,
        blur: 32
    )
}

// MARK: - Shadow Style

public struct ShadowStyle {
    public let color: Color
    public let x: CGFloat
    public let y: CGFloat
    public let blur: CGFloat

    public init(color: Color, x: CGFloat, y: CGFloat, blur: CGFloat) {
        self.color = color
        self.x = x
        self.y = y
        self.blur = blur
    }
}

// MARK: - ViewModifier for Shadow

public struct ShadowModifier: ViewModifier {
    let style: ShadowStyle

    public func body(content: Content) -> some View {
        content
            .shadow(color: style.color, radius: style.blur / 2, x: style.x, y: style.y)
    }
}

extension View {
    public func dsShadow(_ style: ShadowStyle = DSShadow.sm) -> some View {
        modifier(ShadowModifier(style: style))
    }
}
