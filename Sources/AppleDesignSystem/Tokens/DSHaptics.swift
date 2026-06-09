import UIKit

// MARK: - Haptic Engine

public enum DSHaptics {

    // MARK: - Impact Feedback

    public enum ImpactStyle {
        case light, medium, heavy, soft, rigid

        var uiStyle: UIImpactFeedbackGenerator.FeedbackStyle {
            switch self {
            case .light: return .light
            case .medium: return .medium
            case .heavy: return .heavy
            case .soft: return .soft
            case .rigid: return .rigid
            }
        }
    }

    // MARK: - Notification Feedback

    public enum NotificationType {
        case success, warning, error

        var uiType: UINotificationFeedbackGenerator.FeedbackType {
            switch self {
            case .success: return .success
            case .warning: return .warning
            case .error: return .error
            }
        }
    }

    // MARK: - Impact Methods

    public static func impact(_ style: ImpactStyle = .medium) {
        let generator = UIImpactFeedbackGenerator(style: style.uiStyle)
        generator.impactOccurred()
    }

    public static func impact(intensity: Double, style: ImpactStyle = .medium) {
        let generator = UIImpactFeedbackGenerator(style: style.uiStyle)
        generator.impactOccurred(intensity: CGFloat(intensity))
    }

    // MARK: - Notification Methods

    public static func notification(_ type: NotificationType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type.uiType)
    }

    // MARK: - Selection Method

    public static func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
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
