import SwiftUI

// MARK: - Typography Tokens

public enum DSTypography {

    // MARK: - Font Families

    public enum Family {
        public static let sfPro = FontFamily.sfPro
        public static let sfProDisplay = FontFamily.sfProDisplay
        public static let sfProRounded = FontFamily.sfProRounded
        public static let sfMono = FontFamily.sfMono
    }

    // MARK: - Dynamic Type Sizes

    public static let caption2 = Font.caption2
    public static let caption1 = Font.caption
    public static let footnote = Font.footnote
    public static let subheadline = Font.subheadline
    public static let callout = Font.callout
    public static let body = Font.body
    public static let title3 = Font.title3
    public static let title2 = Font.title2
    public static let title1 = Font.title
    public static let largeTitle = Font.largeTitle

    // MARK: - Weighted Fonts

    public static func system(_ style: Font.TextStyle, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        Font.system(style, weight: weight, design: design)
    }

    public static func rounded(_ style: Font.TextStyle, weight: Font.Weight = .regular) -> Font {
        Font.system(style, weight: weight, design: .rounded)
    }

    public static func monospaced(_ style: Font.TextStyle, weight: Font.Weight = .regular) -> Font {
        Font.system(style, weight: weight, design: .monospaced)
    }
}

// MARK: - Font Family Helper

public enum FontFamily {
    case sfPro
    case sfProDisplay
    case sfProRounded
    case sfMono

    var platformValue: String {
        switch self {
        case .sfPro: return ".SFProText"
        case .sfProDisplay: return ".SFProDisplay"
        case .sfProRounded: return ".SFProRounded"
        case .sfMono: return ".SFMono"
        }
    }
}
