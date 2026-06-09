import SwiftUI

// MARK: - DSCard

public enum DSCardStyle {
    case elevated
    case grouped
    case inset
    case plain
}

public struct DSCard<Content: View>: View {
    let style: DSCardStyle
    let cornerRadius: CGFloat
    let padding: CGFloat
    let accessibilityLabel: String?
    let accessibilityHint: String?
    let content: Content

    public init(
        style: DSCardStyle = .elevated,
        cornerRadius: CGFloat = DSRadius.lg,
        padding: CGFloat = DSSpacing.lg,
        accessibilityLabel: String? = nil,
        accessibilityHint: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityHint = accessibilityHint
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(padding)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .dsShadow(cardShadow)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(accessibilityLabel.map { Text($0) } ?? Text("Cartão"))
        .accessibilityHint(accessibilityHint.map { Text($0) } ?? Text(""))
    }

    // MARK: - Style Helpers

    @ViewBuilder
    private var cardBackground: some View {
        switch style {
        case .elevated:
            Color(.systemBackground)
        case .grouped:
            Color(.secondarySystemBackground)
        case .inset:
            Color(.tertiarySystemBackground)
        case .plain:
            Color.clear
        }
    }

    private var cardShadow: ShadowStyle? {
        switch style {
        case .elevated:
            return DSShadow.md
        case .grouped:
            return DSShadow.sm
        case .inset, .plain:
            return nil
        }
    }
}

// MARK: - Card with Header

public struct DSCardWithHeader<Header: View, Content: View>: View {
    let style: DSCardStyle
    let header: Header
    let content: Content

    public init(
        style: DSCardStyle = .elevated,
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.header = header()
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.md) {
            header
                .dsTextStyle(.headline)
                .accessibilityAddTraits(.isHeader)

            Divider()

            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(DSSpacing.lg)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.md)
        .accessibilityElement(children: .contain)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            DSCard(accessibilityLabel: "Cartão de perfil") {
                Text("Elevated Card")
                    .dsTextStyle(.headline)
            }

            DSCardWithHeader(header: { Text("Settings") }) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Option 1")
                    Text("Option 2")
                    Text("Option 3")
                }
            }

            DSCard(style: .inset) {
                Text("Inset Card")
                    .dsTextStyle(.callout)
            }
        }
        .padding()
    }
}
