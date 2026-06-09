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
    let action: () -> Void

    @State private var isPressed = false

    public init(
        _ title: String,
        icon: Image? = nil,
        style: DSButtonStyle = .filled,
        size: DSButtonSize = .medium,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.size = size
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        Button(action: {
            DSHaptics.buttonTap()
            action()
        }) {
            HStack(spacing: DSSpacing.sm) {
                if isLoading {
                    ProgressView()
                        .tint(buttonForegroundColor)
                } else if let icon = icon {
                    icon
                        .resizable()
                        .frame(width: 20, height: 20)
                }

                Text(title)
                    .font(DSTypography.system(size.fontSize, weight: .semibold))
            }
            .foregroundStyle(buttonForegroundColor)
            .frame(maxWidth: .infinity)
            .padding(size.padding)
            .background(buttonBackground)
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
            .dsShadow(style == .filled ? DSShadow.sm : nil)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .opacity(isPressed ? 0.9 : 1.0)
            .animation(DSAnimation.Spring.snappy, value: isPressed)
        }
        .disabled(isLoading)
        .onLongPressGesture(
            pressing: { pressing in
                withAnimation(DSAnimation.Spring.snappy) {
                    isPressed = pressing
                }
            },
            perform: {}
        )
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

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        DSButton("Continue", style: .filled) {}
        DSButton("Learn More", style: .bordered) {}
        DSButton("Tap Here", style: .plain) {}
        DSButton("Glass Button", style: .glass) {}
        DSButton("Delete", style: .destructive) {}
        DSButton("Loading...", isLoading: true) {}
    }
    .padding()
}
