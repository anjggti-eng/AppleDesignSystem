import SwiftUI

// MARK: - Spacing Tokens

public enum DSSpacing {

    /// 2pt
    public static let xxs: CGFloat = 2

    /// 4pt
    public static let xs: CGFloat = 4

    /// 8pt
    public static let sm: CGFloat = 8

    /// 12pt
    public static let md: CGFloat = 12

    /// 16pt
    public static let lg: CGFloat = 16

    /// 20pt
    public static let xl: CGFloat = 20

    /// 24pt
    public static let xxl: CGFloat = 24

    /// 32pt
    public static let xxxl: CGFloat = 32

    /// 40pt
    public static let section: CGFloat = 40
}

// MARK: - Radius Tokens

public enum DSRadius {

    /// 8pt
    public static let sm: CGFloat = 8

    /// 12pt
    public static let md: CGFloat = 12

    /// 14pt
    public static let lg: CGFloat = 14

    /// 16pt
    public static let xl: CGFloat = 16

    /// 20pt
    public static let xxl: CGFloat = 20

    /// Pill shape (capsule)
    public static let pill: CGFloat = 9999
}

// MARK: - Layout Helpers

public enum DSLayout {

    /// Standard horizontal padding for screens
    public static let horizontalPadding: CGFloat = 16

    /// Standard horizontal padding for cards
    public static let cardPadding: CGFloat = 16

    /// Standard vertical spacing between sections
    public static let sectionSpacing: CGFloat = 32

    /// Standard vertical spacing between items
    public static let itemSpacing: CGFloat = 16
}
