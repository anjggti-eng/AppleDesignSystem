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

    @Binding var text: String
    @State private var isFocused = false

    public init(
        _ placeholder: String,
        text: Binding<String>,
        title: String? = nil,
        style: DSTextFieldStyle = .roundedBorder,
        icon: Image? = nil,
        isSecure: Bool = false
    ) {
        self.placeholder = placeholder
        self._text = text
        self.title = title
        self.style = style
        self.icon = icon
        self.isSecure = isSecure
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.xs) {
            if let title = title {
                Text(title)
                    .dsTextStyle(.subheadline)
                    .foregroundStyle(DSColor.Label.secondary)
            }

            HStack(spacing: DSSpacing.sm) {
                if let icon = icon {
                    icon
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(DSColor.Label.tertiary)
                }

                if isSecure {
                    SecureField(placeholder, text: $text)
                        .font(DSTypography.body)
                } else {
                    TextField(placeholder, text: $text)
                        .font(DSTypography.body)
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
        }
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
        if isFocused {
            return DSColor.System.blue
        }
        return DSColor.Fill.primary
    }
}

// MARK: - Search Field

public struct DSSearchBar: View {
    let placeholder: String
    @Binding var text: String

    public init(_ placeholder: String = "Search", text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    public var body: some View {
        HStack(spacing: DSSpacing.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DSColor.Label.tertiary)

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
                }
            }
        }
        .padding(DSSpacing.sm)
        .background(DSColor.Fill.tertiary)
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        DSTextField("Enter your name", text: .constant(""), title: "Name")

        DSTextField("Email", text: .constant("user@example.com"), icon: Image(systemName: "envelope"))

        DSTextField("Password", text: .constant("secret"), isSecure: true)

        DSSearchBar(text: .constant(""))
    }
    .padding()
}
