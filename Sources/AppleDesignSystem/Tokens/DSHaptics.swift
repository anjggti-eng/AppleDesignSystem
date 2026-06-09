import SwiftUI

// MARK: - Haptic Engine (Cross-Platform)

public enum DSHaptics {

    // MARK: - Impact Feedback

    public enum ImpactStyle {
        case light, medium, heavy, soft, rigid
    }

    // MARK: - Notification Feedback

    public enum NotificationType {
        case success, warning, error
    }

    // MARK: - Impact Methods

    public static func impact(_ style: ImpactStyle = .medium) {
        #if os(iOS) || os(visionOS)
        let uiStyle: UIImpactFeedbackGenerator.FeedbackStyle
        switch style {
        case .light: uiStyle = .light
        case .medium: uiStyle = .medium
        case .heavy: uiStyle = .heavy
        case .soft: uiStyle = .soft
        case .rigid: uiStyle = .rigid
        }
        let generator = UIImpactFeedbackGenerator(style: uiStyle)
        generator.impactOccurred()
        #elseif os(watchOS)
        // watchOS has limited haptic support
        WKInterfaceDevice.current().play(.click)
        #else
        // Windows, Linux, macOS - no haptic support
        // Silent no-op
        #endif
    }

    public static func impact(intensity: Double, style: ImpactStyle = .medium) {
        #if os(iOS) || os(visionOS)
        let uiStyle: UIImpactFeedbackGenerator.FeedbackStyle
        switch style {
        case .light: uiStyle = .light
        case .medium: uiStyle = .medium
        case .heavy: uiStyle = .heavy
        case .soft: uiStyle = .soft
        case .rigid: uiStyle = .rigid
        }
        let generator = UIImpactFeedbackGenerator(style: uiStyle)
        generator.impactOccurred(intensity: CGFloat(intensity))
        #else
        // No-op on other platforms
        #endif
    }

    // MARK: - Notification Methods

    public static func notification(_ type: NotificationType) {
        #if os(iOS) || os(visionOS)
        let uiType: UINotificationFeedbackGenerator.FeedbackType
        switch type {
        case .success: uiType = .success
        case .warning: uiType = .warning
        case .error: uiType = .error
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(uiType)
        #else
        // No-op on other platforms
        #endif
    }

    // MARK: - Selection Method

    public static func selection() {
        #if os(iOS) || os(visionOS)
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        #else
        // No-op on other platforms
        #endif
    }

    // MARK: - Predefined Patterns

    public static func buttonTap() {
        impact(.light)
    }

    public static func toggleSwitch() {
        selection()
    }

    public static func success() {
        notification(.success)
    }

    public static func error() {
        notification(.error)
    }

    public static func warning() {
        notification(.warning)
    }
}

// MARK: - watchOS Import

#if os(watchOS)
import WatchKit
#endif
