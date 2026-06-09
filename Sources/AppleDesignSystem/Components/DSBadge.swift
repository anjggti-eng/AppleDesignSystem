import SwiftUI

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
            } else {
                Text(text)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(style == .filled ? .white : color.color)
                    .padding(.horizontal, DSSpacing.sm)
                    .padding(.vertical, DSSpacing.xs)
                    .background(background)
                    .clipShape(Capsule())
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
