import SwiftUI

// MARK: - Animation Tokens

public enum DSAnimation {

    // MARK: - Spring Animations

    public enum Spring {
        /// Default spring: response 0.35, damping 0.7
        public static let `default` = Animation.spring(response: 0.35, dampingFraction: 0.7)

        /// Snappy spring: response 0.25, damping 0.8
        public static let snappy = Animation.spring(response: 0.25, dampingFraction: 0.8)

        /// Bouncy spring: response 0.5, damping 0.6
        public static let bouncy = Animation.spring(response: 0.5, dampingFraction: 0.6)

        /// Gentle spring: response 0.45, damping 0.85
        public static let gentle = Animation.spring(response: 0.45, dampingFraction: 0.85)
    }

    // MARK: - Duration-based

    public enum Duration {
        /// 0.1 seconds
        public static let instant = 0.1

        /// 0.2 seconds
        public static let fast = 0.2

        /// 0.35 seconds
        public static let normal = 0.35

        /// 0.5 seconds
        public static let slow = 0.5
    }

    // MARK: - Curves

    public static let easeIn = Animation.easeIn(duration: Duration.normal)
    public static let easeOut = Animation.easeOut(duration: Duration.normal)
    public static let easeInOut = Animation.easeInOut(duration: Duration.normal)
    public static let linear = Animation.linear(duration: Duration.normal)
}

// MARK: - ViewModifier for Animation

public struct AnimateOnAppearModifier: ViewModifier {
    let animation: Animation
    let value: Bool

    public func body(content: Content) -> some View {
        content
            .opacity(value ? 1 : 0)
            .offset(y: value ? 0 : 10)
            .animation(animation, value: value)
    }
}

extension View {
    public func animateOnAppear(
        with animation: Animation = DSAnimation.Spring.default,
        trigger: Bool = true
    ) -> some View {
        modifier(AnimateOnAppearModifier(animation: animation, value: trigger))
    }
}
