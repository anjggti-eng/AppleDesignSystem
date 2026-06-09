import SwiftUI

// MARK: - Example: Settings Screen

struct DSSettingsExample: View {
    @State private var notificationsEnabled = true
    @State private var darkMode = false
    @State private var hapticFeedback = true

    var body: some View {
        NavigationStack {
            List {
                // Profile Section
                Section {
                    HStack(spacing: DSSpacing.md) {
                        DSAvatar(name: "John Appleseed", size: .lg)

                        VStack(alignment: .leading, spacing: DSSpacing.xs) {
                            Text("John Appleseed")
                                .dsTextStyle(.headline)

                            Text("john@example.com")
                                .dsTextStyle(.subheadline)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(DSColor.Label.tertiary)
                    }
                    .padding(.vertical, DSSpacing.xs)
                }

                // Preferences
                Section("Preferences") {
                    DSToggleRow(
                        icon: Image(systemName: "bell.fill"),
                        title: "Notifications",
                        color: DSColor.System.red,
                        isOn: $notificationsEnabled
                    )

                    DSToggleRow(
                        icon: Image(systemName: "moon.fill"),
                        title: "Dark Mode",
                        color: DSColor.System.purple,
                        isOn: $darkMode
                    )

                    DSToggleRow(
                        icon: Image(systemName: "hand.tap.fill"),
                        title: "Haptic Feedback",
                        color: DSColor.System.blue,
                        isOn: $hapticFeedback
                    )
                }

                // About
                Section("About") {
                    DSLinkRow(
                        icon: Image(systemName: "info.circle.fill"),
                        title: "App Version",
                        value: "1.0.0",
                        color: DSColor.System.blue
                    )

                    DSLinkRow(
                        icon: Image(systemName: "doc.text.fill"),
                        title: "Terms of Service",
                        color: DSColor.System.gray
                    )

                    DSLinkRow(
                        icon: Image(systemName: "lock.shield.fill"),
                        title: "Privacy Policy",
                        color: DSColor.System.green
                    )
                }
            }
            .navigationTitle("Settings")
        }
    }
}

// MARK: - Toggle Row

struct DSToggleRow: View {
    let icon: Image
    let title: String
    let color: Color
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: DSSpacing.md) {
            icon
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding(DSSpacing.xs)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.sm, style: .continuous))

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(DSColor.System.green)
                .onChange(of: isOn) { _, _ in
                    if hapticFeedback {
                        DSHaptics.toggleSwitch()
                    }
                }
        }
    }

    private var hapticFeedback: Bool {
        return true
    }
}

// MARK: - Link Row

struct DSLinkRow: View {
    let icon: Image
    let title: String
    var value: String?
    let color: Color

    var body: some View {
        HStack(spacing: DSSpacing.md) {
            icon
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding(DSSpacing.xs)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.sm, style: .continuous))

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            if let value = value {
                Text(value)
                    .dsTextStyle(.subheadline)
            }

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DSColor.Label.tertiary)
        }
    }
}

// MARK: - Preview

#Preview {
    DSSettingsExample()
}
