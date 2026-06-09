import SwiftUI

// MARK: - DSButton

public enum DSButtonStyle {
    case filled
    case bordered
    case plain
    case glass
    case destructive
}

public enum DSButtonSize {
    case small
    case medium
    case large

    var padding: EdgeInsets {
        switch self {
        case .small: return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .medium: return EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        case .large: return EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)
        }
    }

    var fontSize: Font.TextStyle {
        switch self {
        case .small: return .subheadline
        case .medium: return .body
        case .large: return .title3
        }
    }
}

public struct DSButton: View {
    let title: String
    let icon: Image?
    let style: DSButtonStyle
    let size: DSButtonSize
    let isLoading: Bool
    let hapticStyle: DSHaptics.ImpactStyle
    let accessibilityHint: String?
    let action: () -> Void

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @State private var isPressed = false

    public init(
        _ title: String,
        icon: Image? = nil,
        style: DSButtonStyle = .filled,
        size: DSButtonSize = .medium,
        isLoading: Bool = false,
        hapticStyle: DSHaptics.ImpactStyle = .light,
        accessibilityHint: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.size = size
        self.isLoading = isLoading
        self.hapticStyle = hapticStyle
        self.accessibilityHint = accessibilityHint
        self.action = action
    }

    public var body: some View {
        Button(action: {
            guard !isLoading else { return }
            DSHaptics.impact(hapticStyle)
            action()
        }) {
            HStack(spacing: DSSpacing.sm) {
                if isLoading {
                    ProgressView()
                        .tint(buttonForegroundColor)
                        .scaleEffect(dynamicTypeSize.isAccessibilitySize ? 1.2 : 1.0)
                } else if let icon = icon {
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: dynamicTypeSize.isAccessibilitySize ? 26 : 20,
                            height: dynamicTypeSize.isAccessibilitySize ? 26 : 20
                        )
                        .imageScale(dynamicTypeSize.isAccessibilitySize ? .large : .medium)
                }

                Text(title)
                    .font(DSTypography.system(size.fontSize, weight: .semibold))
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
            }
            .foregroundStyle(buttonForegroundColor)
            .frame(maxWidth: .infinity)
            .padding(size.padding)
            .background(buttonBackground)
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
            .dsShadow(isEnabled && !isLoading ? style == .filled ? DSShadow.sm : nil : nil)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .opacity(isPressed ? 0.9 : 1.0)
            .animation(DSAnimation.Spring.snappy, value: isPressed)
            .animation(DSAnimation.Spring.snappy, value: isLoading)
        }
        .disabled(isLoading || !isEnabled)
        .opacity(isEnabled ? 1.0 : 0.5)
        .onLongPressGesture(
            pressing: { pressing in
                guard !isLoading else { return }
                withAnimation(DSAnimation.Spring.snappy) {
                    isPressed = pressing
                }
            },
            perform: {}
        )
        // MARK: - Accessibility
        .accessibilityLabel(Text(isLoading ? "\(title), carregando" : title))
        .accessibilityAddTraits(.isButton)
        .accessibilityHint(accessibilityHint.map { Text($0) } ?? Text("Toque duas vezes para ativar."))
        .accessibilityElement(children: .combine)
    }

    // MARK: - Style Helpers

    private var buttonForegroundColor: Color {
        switch style {
        case .filled: return .white
        case .bordered: return DSColor.Label.primary
        case .plain: return DSColor.System.blue
        case .glass: return DSColor.Label.primary
        case .destructive: return .white
        }
    }

    private var buttonBackground: some ShapeStyle {
        switch style {
        case .filled:
            return DSColor.System.blue
        case .bordered:
            return DSColor.Fill.primary
        case .plain:
            return Color.clear
        case .glass:
            return AnyShapeStyle(.ultraThinMaterial)
        case .destructive:
            return DSColor.System.red
        }
    }
}

// MARK: - AppleDynamicPressStyle

struct AppleDynamicPressStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        DSButton("Continue", style: .filled) {}
        DSButton("Learn More", style: .bordered) {}
        DSButton("Tap Here", style: .plain) {}
        DSButton("Glass Button", style: .glass) {}
        DSButton("Delete", style: .destructive) {}
        DSButton("Loading...", isLoading: true) {}
        DSButton("Disabled", style: .filled) {}
            .disabled(true)
    }
    .padding()
}
