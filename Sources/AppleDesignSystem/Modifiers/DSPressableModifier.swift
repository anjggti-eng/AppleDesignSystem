import SwiftUI

// MARK: - Pressable Modifier

public struct DSPressableModifier: ViewModifier {
    let hapticStyle: DSHaptics.ImpactStyle
    let animation: Animation

    @State private var isPressed = false

    public init(
        hapticStyle: DSHaptics.ImpactStyle = .light,
        animation: Animation = DSAnimation.Spring.snappy
    ) {
        self.hapticStyle = hapticStyle
        self.animation = animation
    }

    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .opacity(isPressed ? 0.9 : 1.0)
            .animation(animation, value: isPressed)
            .onLongPressGesture(
                pressing: { pressing in
                    withAnimation(animation) {
                        isPressed = pressing
                    }
                },
                perform: {
                    DSHaptics.impact(hapticStyle)
                }
            )
    }
}

extension View {
    public func dsPressable(
        hapticStyle: DSHaptics.ImpactStyle = .light,
        animation: Animation = DSAnimation.Spring.snappy
    ) -> some View {
        modifier(DSPressableModifier(hapticStyle: hapticStyle, animation: animation))
    }
}
