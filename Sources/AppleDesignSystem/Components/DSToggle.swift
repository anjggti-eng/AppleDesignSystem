import SwiftUI

// MARK: - DSToggle

public struct DSToggle: View {
    let title: String
    let icon: Image?
    @Binding var isOn: Bool
    let hapticEnabled: Bool

    public init(
        _ title: String,
        icon: Image? = nil,
        isOn: Binding<Bool>,
        hapticEnabled: Bool = true
    ) {
        self.title = title
        self.icon = icon
        self._isOn = isOn
        self.hapticEnabled = hapticEnabled
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(DSColor.System.blue)
            }

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(DSColor.System.green)
                .onChange(of: isOn) { _, _ in
                    if hapticEnabled {
                        DSHaptics.toggleSwitch()
                    }
                }
        }
    }
}

// MARK: - DSToggleCard

public struct DSToggleCard: View {
    let title: String
    let subtitle: String?
    let icon: Image
    let iconColor: Color
    @Binding var isOn: Bool

    public init(
        title: String,
        subtitle: String? = nil,
        icon: Image,
        iconColor: Color = DSColor.System.blue,
        isOn: Binding<Bool>
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.iconColor = iconColor
        self._isOn = isOn
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            icon
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.white)
                .padding(DSSpacing.sm)
                .background(iconColor)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.sm, style: .continuous))

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

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(DSColor.System.green)
                .onChange(of: isOn) { _, _ in
                    DSHaptics.toggleSwitch()
                }
        }
        .padding(DSSpacing.md)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 16) {
        DSToggle("Dark Mode", icon: Image(systemName: "moon.fill"), isOn: .constant(true))
        DSToggle("Notifications", isOn: .constant(false))

        DSToggleCard(
            title: "Wi-Fi",
            subtitle: "Connected to Home Network",
            icon: Image(systemName: "wifi"),
            iconColor: DSColor.System.blue,
            isOn: .constant(true)
        )
    }
    .padding()
}
