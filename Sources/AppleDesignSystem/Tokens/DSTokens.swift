import SwiftUI

// MARK: - Color Tokens (Semantic Naming)

public enum DSColor {

    // MARK: - Action (Interactive Elements)

    public enum Action {
        public static let background = DSColor.System.blue
        public static let backgroundPressed = DSColor.System.blue.opacity(0.8)
        public static let backgroundDisabled = DSColor.System.gray.opacity(0.3)

        public static let foreground = Color.white
        public static let foregroundDisabled = DSColor.Label.tertiary
    }

    // MARK: - Destructive (Dangerous Actions)

    public enum Destructive {
        public static let background = DSColor.System.red
        public static let backgroundPressed = DSColor.System.red.opacity(0.8)
        public static let backgroundDisabled = DSColor.System.gray.opacity(0.3)

        public static let foreground = Color.white
        public static let foregroundDisabled = DSColor.Label.tertiary
    }

    // MARK: - Success (Positive Feedback)

    public enum Success {
        public static let background = DSColor.System.green
        public static let foreground = Color.white
        public static let muted = DSColor.System.green.opacity(0.1)
    }

    // MARK: - Warning (Caution)

    public enum Warning {
        public static let background = DSColor.System.orange
        public static let foreground = Color.white
        public static let muted = DSColor.System.orange.opacity(0.1)
    }

    // MARK: - Error (Errors & Alerts)

    public enum Error {
        public static let background = DSColor.System.red
        public static let foreground = Color.white
        public static let muted = DSColor.System.red.opacity(0.1)
    }

    // MARK: - Information (Neutral Info)

    public enum Information {
        public static let background = DSColor.System.blue
        public static let foreground = Color.white
        public static let muted = DSColor.System.blue.opacity(0.1)
    }

    // MARK: - Background

    public enum Background {
        #if os(iOS) || os(visionOS)
        public static let primary = Color(.systemBackground)
        public static let secondary = Color(.secondarySystemBackground)
        public static let tertiary = Color(.tertiarySystemBackground)
        public static let elevated = Color(.systemBackground)
        #elseif os(macOS)
        public static let primary = Color(.windowBackgroundColor)
        public static let secondary = Color(.controlBackgroundColor)
        public static let tertiary = Color(.controlBackgroundColor)
        public static let elevated = Color(.windowBackgroundColor)
        #else
        public static let primary = Color.white
        public static let secondary = Color(white: 0.95)
        public static let tertiary = Color(white: 0.98)
        public static let elevated = Color.white
        #endif
    }

    // MARK: - Label

    public enum Label {
        #if os(iOS) || os(visionOS)
        public static let primary = Color(.label)
        public static let secondary = Color(.secondaryLabel)
        public static let tertiary = Color(.tertiaryLabel)
        #elseif os(macOS)
        public static let primary = Color(.labelColor)
        public static let secondary = Color(.secondaryLabelColor)
        public static let tertiary = Color(.tertiaryLabelColor)
        #else
        public static let primary = Color.black
        public static let secondary = Color.gray
        public static let tertiary = Color.gray.opacity(0.6)
        #endif
    }

    // MARK: - Fill

    public enum Fill {
        #if os(iOS) || os(visionOS)
        public static let primary = Color(.systemFill)
        public static let secondary = Color(.secondarySystemFill)
        public static let tertiary = Color(.tertiarySystemFill)
        #elseif os(macOS)
        public static let primary = Color(.controlColor)
        public static let secondary = Color(.controlColor).opacity(0.5)
        public static let tertiary = Color(.controlColor).opacity(0.3)
        #else
        public static let primary = Color.gray.opacity(0.2)
        public static let secondary = Color.gray.opacity(0.15)
        public static let tertiary = Color.gray.opacity(0.1)
        #endif
    }

    // MARK: - Surface (Cards, Sheets, etc.)

    public enum Surface {
        public static let primary = Background.primary
        public static let secondary = Background.secondary
        public static let elevated = Background.elevated
        public static let overlay = Color.black.opacity(0.4)
    }

    // MARK: - Border

    public enum Border {
        public static let primary = Fill.primary
        public static let secondary = Fill.secondary
        public static let focus = DSColor.System.blue
    }

    // MARK: - System Colors

    public static let blue = Color.blue
    public static let green = Color.green
    public static let red = Color.red
    public static let orange = Color.orange
    public static let yellow = Color.yellow
    public static let purple = Color.purple
    public static let pink = Color.pink
    public static let teal = Color.teal
    public static let indigo = Color.indigo
    public static let gray = Color.gray
}

// MARK: - Hex Color Extension

extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
