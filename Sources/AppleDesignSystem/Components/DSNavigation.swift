import SwiftUI

// MARK: - DSNavigationBar

public struct DSNavigationBar<Leading: View, Title: View, Trailing: View>: View {
    let leading: Leading
    let title: Title
    let trailing: Trailing
    let hasBlur: Bool

    public init(
        hasBlur: Bool = true,
        @ViewBuilder leading: () -> Leading = { EmptyView() },
        @ViewBuilder title: () -> Title,
        @ViewBuilder trailing: () -> Trailing = { EmptyView() }
    ) {
        self.leading = leading()
        self.title = title()
        self.trailing = trailing()
        self.hasBlur = hasBlur
    }

    public var body: some View {
        HStack {
            leading

            Spacer()

            title
                .dsTextStyle(.headline)

            Spacer()

            trailing
        }
        .padding(.horizontal, DSSpacing.lg)
        .padding(.vertical, DSSpacing.md)
        .background(hasBlur ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(Color(.systemBackground)))
    }
}

// MARK: - DSNavigationContainer

public struct DSNavigationContainer<Content: View>: View {
    let title: String
    let showsBackButton: Bool
    let onBack: (() -> Void)?
    let content: Content

    public init(
        _ title: String,
        showsBackButton: Bool = false,
        onBack: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.showsBackButton = showsBackButton
        self.onBack = onBack
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 0) {
            // Custom Navigation Bar
            HStack {
                if showsBackButton {
                    Button(action: {
                        DSHaptics.impact(.light)
                        onBack?()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .font(.body.weight(.semibold))
                            Text("Back")
                                .font(.body)
                        }
                        .foregroundStyle(DSColor.System.blue)
                    }
                    .accessibilityLabel("Voltar")
                }

                Spacer()

                Text(title)
                    .dsTextStyle(.headline)
                    .lineLimit(1)

                Spacer()

                // Balance spacer
                if showsBackButton {
                    Color.clear.frame(width: 60, height: 1)
                }
            }
            .padding(.horizontal, DSSpacing.lg)
            .padding(.vertical, DSSpacing.md)
            .background(.ultraThinMaterial)

            Divider()

            // Content
            content
        }
    }
}

// MARK: - DSListHeader

public struct DSListHeader: View {
    let title: String
    let action: String?
    let onAction: (() -> Void)?

    public init(
        _ title: String,
        action: String? = nil,
        onAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.action = action
        self.onAction = onAction
    }

    public var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(DSColor.Label.secondary)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            if let action = action, let onAction = onAction {
                Button(action: {
                    DSHaptics.impact(.light)
                    onAction()
                }) {
                    Text(action)
                        .font(.footnote)
                        .foregroundStyle(DSColor.System.blue)
                }
                .accessibilityLabel("\(action) \(title)")
            }
        }
        .padding(.horizontal, DSSpacing.lg)
        .padding(.top, DSSpacing.lg)
        .padding(.bottom, DSSpacing.sm)
    }
}

// MARK: - Preview

#Preview {
    DSNavigationContainer("Settings", showsBackButton: true) {
        ScrollView {
            VStack(spacing: 0) {
                DSListHeader("GENERAL", action: "Edit")

                VStack(spacing: 1) {
                    HStack {
                        Text("Airplane Mode")
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))

                    HStack {
                        Text("Wi-Fi")
                        Spacer()
                        Text("Home")
                            .foregroundStyle(DSColor.Label.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                }
            }
        }
    }
}
