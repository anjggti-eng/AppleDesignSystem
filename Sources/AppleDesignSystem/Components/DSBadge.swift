import SwiftUI

// MARK: - DSTooltip

public enum DSTooltipPosition {
    case top, bottom, leading, trailing
}

public struct DSTooltip: ViewModifier {
    let text: String
    let position: DSTooltipPosition
    let isVisible: Bool

    public func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isVisible {
                        tooltipView
                    }
                }
            )
    }

    private var tooltipView: some View {
        VStack(spacing: 0) {
            if position == .bottom { Spacer() }

            if position == .top || position == .bottom {
                VStack(spacing: 4) {
                    Text(text)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(.horizontal, DSSpacing.sm)
                        .padding(.vertical, DSSpacing.xs)
                        .background(DSColor.Label.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                }
            }

            if position == .top { Spacer() }
        }
        .padding(position == .top || position == .bottom ? .horizontal : .vertical, 4)
    }
}

extension View {
    public func tooltip(_ text: String, position: DSTooltipPosition = .top, isVisible: Bool = true) -> some View {
        modifier(DSTooltip(text: text, position: position, isVisible: isVisible))
    }
}

// MARK: - DSContextMenuItem

public struct DSContextMenuItem: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void

    public init(
        icon: String,
        title: String,
        color: Color = DSColor.Label.primary,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: {
            DSHaptics.impact(.light)
            action()
        }) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 20)
                Text(title)
            }
        }
    }
}

// MARK: - DSConfirmationDialog

public struct DSConfirmationDialog: ViewModifier {
    let title: String
    let message: String?
    let buttons: [DSAlertButton]
    @Binding var isPresented: Bool

    public func body(content: Content) -> some View {
        content
            .confirmationDialog(
                title,
                isPresented: $isPresented,
                titleVisibility: .visible
            ) {
                ForEach(buttons) { button in
                    Button(role: button.role) {
                        DSHaptics.impact(.light)
                        isPresented = false
                        button.action()
                    } label: {
                        Text(button.title)
                    }
                }
            } message: {
                if let message = message {
                    Text(message)
                }
            }
    }
}

public struct DSAlertButton: Identifiable {
    public let id = UUID()
    let title: String
    let role: ButtonRole?
    let action: () -> Void

    public init(
        title: String,
        role: ButtonRole? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.role = role
        self.action = action
    }
}

extension View {
    public func dsConfirmationDialog(
        _ title: String,
        message: String? = nil,
        buttons: [DSAlertButton],
        isPresented: Binding<Bool>
    ) -> some View {
        modifier(DSConfirmationDialog(title: title, message: message, buttons: buttons, isPresented: isPresented))
    }
}

// MARK: - DSBadge

public enum DSBadgeStyle {
    case filled
    case outlined
    case dot
}

public enum DSBadgeColor {
    case blue, green, red, orange, yellow, purple, gray

    var color: Color {
        switch self {
        case .blue: return DSColor.System.blue
        case .green: return DSColor.System.green
        case .red: return DSColor.System.red
        case .orange: return DSColor.System.orange
        case .yellow: return DSColor.System.yellow
        case .purple: return DSColor.System.purple
        case .gray: return DSColor.Label.tertiary
        }
    }
}

public struct DSBadge: View {
    let text: String
    let style: DSBadgeStyle
    let color: DSBadgeColor

    public init(
        _ text: String,
        style: DSBadgeStyle = .filled,
        color: DSBadgeColor = .blue
    ) {
        self.text = text
        self.style = style
        self.color = color
    }

    public var body: some View {
        Group {
            if style == .dot {
                Circle()
                    .fill(color.color)
                    .frame(width: 8, height: 8)
                    .accessibilityLabel("Indicador")
            } else {
                Text(text)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(style == .filled ? .white : color.color)
                    .padding(.horizontal, DSSpacing.sm)
                    .padding(.vertical, DSSpacing.xs)
                    .background(background)
                    .clipShape(Capsule())
                    .accessibilityLabel(text)
            }
        }
    }

    @ViewBuilder
    private var background: some View {
        switch style {
        case .filled:
            color.color
        case .outlined:
            color.color.opacity(0.1)
        case .dot:
            Color.clear
        }
    }
}

// MARK: - DSBadge with Count

public struct DSCountBadge: View {
    let count: Int
    let color: DSBadgeColor

    public init(count: Int, color: DSBadgeColor = .red) {
        self.count = count
        self.color = color
    }

    public var body: some View {
        Group {
            if count > 0 {
                Text(count > 99 ? "99+" : "\(count)")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, DSSpacing.xs)
                    .padding(.vertical, DSSpacing.xxs)
                    .background(color.color)
                    .clipShape(Capsule())
                    .accessibilityLabel("\(count) notificações")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        HStack {
            DSBadge("New")
            DSBadge("Active", color: .green)
            DSBadge("Error", color: .red)
        }

        HStack {
            DSBadge("Outlined", style: .outlined)
            DSBadge("Warning", style: .outlined, color: .orange)
        }

        HStack {
            DSBadge("", style: .dot)
            DSCountBadge(count: 5)
            DSCountBadge(count: 150)
        }
    }
    .padding()
}
