import SwiftUI

// MARK: - DSListRow

public enum DSListRowAccessory {
    case none
    case disclosure
    case checkmark(Bool)
    case value(String)
    case badge(Int)
    case toggle(Binding<Bool>)
    case icon(Image)
}

public struct DSListRow<Leading: View, Trailing: View>: View {
    let title: String
    let subtitle: String?
    let icon: Image?
    let iconColor: Color
    let accessory: DSListRowAccessory
    let leading: Leading?
    let trailing: Trailing?

    public init(
        title: String,
        subtitle: String? = nil,
        icon: Image? = nil,
        iconColor: Color = DSColor.System.blue,
        accessory: DSListRowAccessory = .disclosure,
        @ViewBuilder leading: () -> Leading = { EmptyView() },
        @ViewBuilder trailing: () -> Trailing = { EmptyView() }
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.iconColor = iconColor
        self.accessory = accessory
        self.leading = leading()
        self.trailing = trailing()
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            leading

            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(DSSpacing.xs)
                    .background(iconColor)
                    .clipShape(RoundedRectangle(cornerRadius: DSRadius.sm, style: .continuous))
            }

            VStack(alignment: .leading, spacing: DSSpacing.xxs) {
                Text(title)
                    .dsTextStyle(.body)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .dsTextStyle(.caption)
                        .foregroundStyle(DSColor.Label.secondary)
                }
            }

            Spacer()

            trailing

            accessoryView
        }
        .contentShape(Rectangle())
    }

    @ViewBuilder
    private var accessoryView: some View {
        switch accessory {
        case .none:
            EmptyView()
        case .disclosure:
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DSColor.Label.tertiary)
        case .checkmark(let isChecked):
            if isChecked {
                Image(systemName: "checkmark")
                    .foregroundStyle(DSColor.System.blue)
            }
        case .value(let text):
            Text(text)
                .dsTextStyle(.subheadline)
                .foregroundStyle(DSColor.Label.secondary)
        case .badge(let count):
            DSCountBadge(count: count)
        case .toggle(let isOn):
            Toggle("", isOn: isOn)
                .labelsHidden()
                .tint(DSColor.System.green)
        case .icon(let img):
            img
                .foregroundStyle(DSColor.Label.tertiary)
        }
    }
}

// MARK: - DSSection

public struct DSSection<Content: View, Header: View, Footer: View>: View {
    let header: Header
    let footer: Footer
    let content: Content

    public init(
        @ViewBuilder header: () -> Header = { EmptyView() },
        @ViewBuilder footer: () -> Footer = { EmptyView() },
        @ViewBuilder content: () -> Content
    ) {
        self.header = header()
        self.footer = footer()
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            header
                .dsTextStyle(.footnote)
                .foregroundStyle(DSColor.Label.secondary)
                .padding(.horizontal, DSSpacing.lg)

            VStack(spacing: 0) {
                content
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))

            footer
                .dsTextStyle(.caption)
                .foregroundStyle(DSColor.Label.tertiary)
                .padding(.horizontal, DSSpacing.lg)
        }
    }
}

// MARK: - DSListGroup

public struct DSListGroup<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 1) {
            content
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))
    }
}

// MARK: - DSListRowSimple (for easy use)

public struct DSListRowSimple: View {
    let title: String
    let subtitle: String?
    let icon: Image?
    let iconColor: Color
    let accessory: DSListRowAccessory
    let action: (() -> Void)?

    public init(
        _ title: String,
        subtitle: String? = nil,
        icon: Image? = nil,
        iconColor: Color = DSColor.System.blue,
        accessory: DSListRowAccessory = .disclosure,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.iconColor = iconColor
        self.accessory = accessory
        self.action = action
    }

    public var body: some View {
        Button(action: {
            DSHaptics.impact(.light)
            action?()
        }) {
            DSListRow(
                title: title,
                subtitle: subtitle,
                icon: icon,
                iconColor: iconColor,
                accessory: accessory
            )
            .padding(.horizontal, DSSpacing.lg)
            .padding(.vertical, DSSpacing.md)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: DSSpacing.xl) {
            DSSection(header: { Text("GENERAL") }) {
                DSListRowSimple(
                    "Airplane Mode",
                    icon: Image(systemName: "airplane"),
                    iconColor: DSColor.System.orange,
                    accessory: .toggle(.constant(false))
                )

                DSListRowSimple(
                    "Wi-Fi",
                    subtitle: "Home Network",
                    icon: Image(systemName: "wifi"),
                    iconColor: DSColor.System.blue
                )

                DSListRowSimple(
                    "Bluetooth",
                    subtitle: "On",
                    icon: Image(systemName: "antenna.radiowaves.left.and.right"),
                    iconColor: DSColor.System.blue
                )
            }

            DSSection(header: { Text("ACCOUNT") }) {
                DSListRowSimple(
                    "Notifications",
                    icon: Image(systemName: "bell.fill"),
                    iconColor: DSColor.System.red
                )

                DSListRowSimple(
                    "Privacy",
                    icon: Image(systemName: "lock.shield.fill"),
                    iconColor: DSColor.System.green
                )
            }
        }
        .padding(.vertical, DSSpacing.lg)
    }
}
