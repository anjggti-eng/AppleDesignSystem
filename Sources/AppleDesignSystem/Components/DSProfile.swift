import SwiftUI

// MARK: - DSProfileHeader

public struct DSProfileHeader: View {
    let name: String
    let subtitle: String?
    let imageUrl: String?
    let size: DSAvatarSize

    public init(
        name: String,
        subtitle: String? = nil,
        imageUrl: String? = nil,
        size: DSAvatarSize = .xl
    ) {
        self.name = name
        self.subtitle = subtitle
        self.imageUrl = imageUrl
        self.size = size
    }

    public var body: some View {
        VStack(spacing: DSSpacing.md) {
            DSAvatar(name: name, imageUrl: imageUrl, size: size)

            VStack(spacing: DSSpacing.xs) {
                Text(name)
                    .dsTextStyle(.title2)
                    .accessibilityAddTraits(.isHeader)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .dsTextStyle(.subheadline)
                        .foregroundStyle(DSColor.Label.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DSSpacing.xl)
    }
}

// MARK: - DSProfileRow

public struct DSProfileRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String?
    let accessory: DSListRowAccessory

    public init(
        icon: String,
        iconColor: Color = DSColor.System.blue,
        title: String,
        value: String? = nil,
        accessory: DSListRowAccessory = .disclosure
    ) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.value = value
        self.accessory = accessory
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            Image(systemName: icon)
                .font(.body)
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .background(iconColor)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.sm, style: .continuous))
                .accessibilityHidden(true)

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            if let value = value {
                Text(value)
                    .dsTextStyle(.subheadline)
                    .foregroundStyle(DSColor.Label.secondary)
            }

            accessoryView
        }
    }

    @ViewBuilder
    private var accessoryView: some View {
        switch accessory {
        case .disclosure:
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DSColor.Label.tertiary)
        case .checkmark(let isChecked):
            if isChecked {
                Image(systemName: "checkmark")
                    .foregroundStyle(DSColor.System.blue)
            }
        default:
            EmptyView()
        }
    }
}

// MARK: - DSStatBox

public struct DSStatBox: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    let trend: String?
    let isTrendPositive: Bool?

    public init(
        title: String,
        value: String,
        icon: String,
        color: Color,
        trend: String? = nil,
        isTrendPositive: Bool? = nil
    ) {
        self.title = title
        self.value = value
        self.icon = icon
        self.color = color
        self.trend = trend
        self.isTrendPositive = isTrendPositive
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(color)
                    .accessibilityHidden(true)

                Spacer()

                if let trend = trend, let isPositive = isTrendPositive {
                    HStack(spacing: 2) {
                        Image(systemName: isPositive ? "arrow.up" : "arrow.down")
                            .font(.caption2)
                        Text(trend)
                            .font(.caption2)
                    }
                    .foregroundStyle(isPositive ? DSColor.System.green : DSColor.System.red)
                    .padding(.horizontal, DSSpacing.xs)
                    .padding(.vertical, DSSpacing.xxs)
                    .background((isPositive ? DSColor.System.green : DSColor.System.red).opacity(0.1))
                    .clipShape(Capsule())
                }
            }

            Text(title)
                .dsTextStyle(.caption)
                .foregroundStyle(DSColor.Label.secondary)

            Text(value)
                .dsTextStyle(.title2)
                .fontWeight(.bold)
        }
        .padding(DSSpacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title): \(value)"))
    }
}

// MARK: - DSInfoRow

public struct DSInfoRow: View {
    let label: String
    let value: String

    public init(_ label: String, value: String) {
        self.label = label
        self.value = value
    }

    public var body: some View {
        HStack {
            Text(label)
                .dsTextStyle(.body)
                .foregroundStyle(DSColor.Label.secondary)

            Spacer()

            Text(value)
                .dsTextStyle(.body)
        }
        .padding(.vertical, DSSpacing.xs)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 0) {
            DSProfileHeader(
                name: "John Appleseed",
                subtitle: "john@example.com"
            )

            DSStatBox(
                title: "Total Revenue",
                value: "$12,345",
                icon: "dollarsign.circle.fill",
                color: DSColor.System.green,
                trend: "+12.5%",
                isTrendPositive: true
            )
            .padding()

            VStack(spacing: 0) {
                DSProfileRow(icon: "person.fill", title: "Edit Profile")
                DSProfileRow(icon: "bell.fill", iconColor: DSColor.System.red, title: "Notifications", value: "3")
                DSProfileRow(icon: "lock.shield.fill", iconColor: DSColor.System.green, title: "Privacy")
            }
        }
    }
}
