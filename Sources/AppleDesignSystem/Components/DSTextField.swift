import SwiftUI

// MARK: - DSTextField

public enum DSTextFieldStyle {
    case plain
    case bordered
    case roundedBorder
    case search
}

public struct DSTextField: View {
    let title: String?
    let placeholder: String
    let style: DSTextFieldStyle
    let icon: Image?
    let isSecure: Bool
    let errorMessage: String?
    let accessibilityLabel: String?
    let accessibilityHint: String?

    @Binding var text: String
    @FocusState private var isFocused: Bool

    public init(
        _ placeholder: String,
        text: Binding<String>,
        title: String? = nil,
        style: DSTextFieldStyle = .roundedBorder,
        icon: Image? = nil,
        isSecure: Bool = false,
        errorMessage: String? = nil,
        accessibilityLabel: String? = nil,
        accessibilityHint: String? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.style = style
        self.icon = icon
        self.isSecure = isSecure
        self.errorMessage = errorMessage
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityHint = accessibilityHint
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.xs) {
            if let title = title {
                Text(title)
                    .dsTextStyle(.subheadline)
                    .foregroundStyle(DSColor.Label.secondary)
                    .accessibilityAddTraits(.isHeader)
            }

            HStack(spacing: DSSpacing.sm) {
                if let icon = icon {
                    icon
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(isFocused ? DSColor.System.blue : DSColor.Label.tertiary)
                        .accessibilityHidden(true)
                }

                if isSecure {
                    SecureField(placeholder, text: $text)
                        .font(DSTypography.body)
                        .focused($isFocused)
                } else {
                    TextField(placeholder, text: $text)
                        .font(DSTypography.body)
                        .focused($isFocused)
                }

                if !text.isEmpty {
                    Button(action: {
                        withAnimation(DSAnimation.Spring.snappy) {
                            text = ""
                        }
                        DSHaptics.impact(.light)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(DSColor.Label.tertiary)
                            .accessibilityLabel("Limpar texto")
                    }
                }
            }
            .padding(DSSpacing.md)
            .background(fieldBackground)
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous)
                    .stroke(borderColor, lineWidth: isFocused ? 2 : 1)
            )
            .animation(DSAnimation.Spring.snappy, value: isFocused)

            if let error = errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundStyle(DSColor.System.red)
                    .accessibilityLabel("Erro: \(error)")
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(accessibilityLabel ?? title ?? placeholder))
        .accessibilityHint(accessibilityHint.map { Text($0) } ?? Text("Campo de texto"))
    }

    // MARK: - Style Helpers

    private var fieldBackground: some ShapeStyle {
        switch style {
        case .plain, .search:
            return AnyShapeStyle(DSColor.Fill.tertiary)
        case .bordered, .roundedBorder:
            return AnyShapeStyle(Color(.systemBackground))
        }
    }

    private var borderColor: Color {
        if let _ = errorMessage {
            return DSColor.System.red
        }
        if isFocused {
            return DSColor.System.blue
        }
        return DSColor.Fill.primary
    }
}

// MARK: - Search Field

public struct DSSearchBar: View {
    let placeholder: String
    let accessibilityLabel: String?
    @Binding var text: String

    public init(
        _ placeholder: String = "Search",
        text: Binding<String>,
        accessibilityLabel: String? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.accessibilityLabel = accessibilityLabel
    }

    public var body: some View {
        HStack(spacing: DSSpacing.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DSColor.Label.tertiary)
                .accessibilityHidden(true)

            TextField(placeholder, text: $text)
                .font(DSTypography.body)

            if !text.isEmpty {
                Button(action: {
                    withAnimation(DSAnimation.Spring.snappy) {
                        text = ""
                    }
                    DSHaptics.impact(.light)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(DSColor.Label.tertiary)
                        .accessibilityLabel("Limpar pesquisa")
                }
            }
        }
        .padding(DSSpacing.sm)
        .background(DSColor.Fill.tertiary)
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(accessibilityLabel ?? "Campo de pesquisa"))
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        DSTextField("Enter your name", text: .constant(""), title: "Name")

        DSTextField("Email", text: .constant("user@example.com"), icon: Image(systemName: "envelope"))

        DSTextField("Password", text: .constant("secret"), isSecure: true)

        DSTextField("Email", text: .constant("invalid"), errorMessage: "Email inválido")

        DSSearchBar(text: .constant(""))
    }
    .padding()
}
