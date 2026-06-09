import SwiftUI

// MARK: - Text Hierarchy Modifier

public enum TextRole {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subheadline
    case footnote
    case caption
    case caption2

    var style: Font.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title1: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .body: return .body
        case .callout: return .callout
        case .subheadline: return .subheadline
        case .footnote: return .footnote
        case .caption: return .caption
        case .caption2: return .caption2
        }
    }

    var weight: Font.Weight {
        switch self {
        case .largeTitle: return .bold
        case .title1: return .bold
        case .title2: return .bold
        case .title3: return .semibold
        case .headline: return .semibold
        case .body: return .regular
        case .callout: return .regular
        case .subheadline: return .regular
        case .footnote: return .regular
        case .caption: return .regular
        case .caption2: return .regular
        }
    }

    var foreground: Color {
        switch self {
        case .largeTitle, .title1, .title2, .title3, .headline:
            return DSColor.Label.primary
        case .body, .callout:
            return DSColor.Label.primary
        case .subheadline, .footnote, .caption, .caption2:
            return DSColor.Label.secondary
        }
    }
}

public struct DSTextModifier: ViewModifier {
    let role: TextRole

    public func body(content: Content) -> some View {
        content
            .font(DSTypography.system(role.style, weight: role.weight))
            .foregroundStyle(role.foreground)
    }
}

extension View {
    public func dsTextStyle(_ role: TextRole) -> some View {
        modifier(DSTextModifier(role: role))
    }
}
