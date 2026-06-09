import SwiftUI

// MARK: - Color Tokens

public enum DSColor {

    // MARK: - Background

    public enum Background {
        public static let primary = Color("bgPrimary", bundle: .main)
        public static let secondary = Color("bgSecondary", bundle: .main)
        public static let tertiary = Color("bgTertiary", bundle: .main)
        public static let elevated = Color("bgElevated", bundle: .main)
    }

    // MARK: - Label

    public enum Label {
        public static let primary = Color("labelPrimary", bundle: .main)
        public static let secondary = Color("labelSecondary", bundle: .main)
        public static let tertiary = Color("labelTertiary", bundle: .main)
    }

    // MARK: - Fill

    public enum Fill {
        public static let primary = Color("fillPrimary", bundle: .main)
        public static let secondary = Color("fillSecondary", bundle: .main)
        public static let tertiary = Color("fillTertiary", bundle: .main)
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
}

// MARK: - Hex Color Extension

extension Color {
    init(hex: String) {
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
