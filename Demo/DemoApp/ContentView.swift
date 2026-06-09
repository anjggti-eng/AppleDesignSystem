import SwiftUI
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        TabView {
            ComponentsShowcase()
                .tabItem {
                    Label("Components", systemImage: "square.grid.2x2")
                }

            TokensShowcase()
                .tabItem {
                    Label("Tokens", systemImage: "paintpalette")
                }

            ExamplesShowcase()
                .tabItem {
                    Label("Examples", systemImage: "doc.text")
                }
        }
    }
}

// MARK: - Components Showcase

struct ComponentsShowcase: View {
    @State private var text = ""
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: DSSpacing.xl) {
                    // Buttons
                    SectionHeader("Buttons")

                    VStack(spacing: DSSpacing.md) {
                        DSButton("Filled Button", style: .filled) {}
                        DSButton("Bordered Button", style: .bordered) {}
                        DSButton("Glass Button", style: .glass) {}
                        DSButton("Destructive", style: .destructive) {}
                        DSButton("Loading...", isLoading: true) {}
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // TextFields
                    SectionHeader("Text Fields")

                    VStack(spacing: DSSpacing.md) {
                        DSTextField("Enter text", text: $text, title: "Name")
                        DSTextField("Email", text: .constant(""), icon: Image(systemName: "envelope"))
                        DSSearchBar("Search...", text: $text)
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // Badges
                    SectionHeader("Badges")

                    HStack {
                        DSBadge("New")
                        DSBadge("Active", color: .green)
                        DSBadge("Error", color: .red)
                        DSBadge("Outlined", style: .outlined)
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // Avatars
                    SectionHeader("Avatars")

                    HStack {
                        DSAvatar(name: "John Appleseed", size: .sm)
                        DSAvatar(name: "Jane Smith", size: .md)
                        DSAvatar(name: "Bob Wilson", size: .lg)
                        DSAvatar(name: "Alice Brown", size: .xl)
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // Loading
                    SectionHeader("Loading Indicators")

                    HStack {
                        DSLoadingIndicator(style: .spinner)
                        DSLoadingIndicator(style: .dots)
                        DSLoadingIndicator(style: .pulse)
                        DSLoadingIndicator(style: .progress)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, DSSpacing.lg)
                }
                .padding(.vertical, DSSpacing.lg)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Components")
        }
    }
}

// MARK: - Tokens Showcase

struct TokensShowcase: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: DSSpacing.xl) {
                    // Colors
                    SectionHeader("System Colors")

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: DSSpacing.md) {
                            ColorSwatch(color: DSColor.System.blue, name: "Blue")
                            ColorSwatch(color: DSColor.System.green, name: "Green")
                            ColorSwatch(color: DSColor.System.red, name: "Red")
                            ColorSwatch(color: DSColor.System.orange, name: "Orange")
                            ColorSwatch(color: DSColor.System.purple, name: "Purple")
                            ColorSwatch(color: DSColor.System.pink, name: "Pink")
                        }
                        .padding(.horizontal, DSSpacing.lg)
                    }

                    // Typography
                    SectionHeader("Typography")

                    VStack(alignment: .leading, spacing: DSSpacing.md) {
                        Text("Large Title").dsTextStyle(.largeTitle)
                        Text("Title 1").dsTextStyle(.title1)
                        Text("Title 2").dsTextStyle(.title2)
                        Text("Title 3").dsTextStyle(.title3)
                        Text("Headline").dsTextStyle(.headline)
                        Text("Body").dsTextStyle(.body)
                        Text("Callout").dsTextStyle(.callout)
                        Text("Subheadline").dsTextStyle(.subheadline)
                        Text("Footnote").dsTextStyle(.footnote)
                        Text("Caption").dsTextStyle(.caption)
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // Spacing
                    SectionHeader("Spacing")

                    VStack(spacing: DSSpacing.sm) {
                        SpacingRow(name: "xxs", value: DSSpacing.xxs)
                        SpacingRow(name: "xs", value: DSSpacing.xs)
                        SpacingRow(name: "sm", value: DSSpacing.sm)
                        SpacingRow(name: "md", value: DSSpacing.md)
                        SpacingRow(name: "lg", value: DSSpacing.lg)
                        SpacingRow(name: "xl", value: DSSpacing.xl)
                        SpacingRow(name: "xxl", value: DSSpacing.xxl)
                    }
                    .padding(.horizontal, DSSpacing.lg)

                    // Shadows
                    SectionHeader("Shadows")

                    HStack {
                        ShadowCard(name: "sm", shadow: DSShadow.sm)
                        ShadowCard(name: "md", shadow: DSShadow.md)
                        ShadowCard(name: "lg", shadow: DSShadow.lg)
                        ShadowCard(name: "xl", shadow: DSShadow.xl)
                    }
                    .padding(.horizontal, DSSpacing.lg)
                }
                .padding(.vertical, DSSpacing.lg)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Tokens")
        }
    }
}

// MARK: - Examples Showcase

struct ExamplesShowcase: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: DSLoginExample()) {
                    ExampleRow(title: "Login Screen", icon: "person.circle.fill", color: DSColor.System.blue)
                }

                NavigationLink(destination: DSSettingsExample()) {
                    ExampleRow(title: "Settings Screen", icon: "gearshape.fill", color: DSColor.System.gray)
                }

                NavigationLink(destination: DSDashboardExample()) {
                    ExampleRow(title: "Dashboard Screen", icon: "chart.bar.fill", color: DSColor.System.green)
                }
            }
            .navigationTitle("Examples")
        }
    }
}

// MARK: - Helper Views

struct SectionHeader: View {
    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .dsTextStyle(.title3)
            .padding(.horizontal, DSSpacing.lg)
    }
}

struct ColorSwatch: View {
    let color: Color
    let name: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: DSRadius.md)
                .fill(color)
                .frame(width: 60, height: 60)

            Text(name)
                .dsTextStyle(.caption)
        }
    }
}

struct SpacingRow: View {
    let name: String
    let value: CGFloat

    var body: some View {
        HStack {
            Text(name)
                .dsTextStyle(.callout)
                .frame(width: 40, alignment: .leading)

            RoundedRectangle(cornerRadius: 2)
                .fill(DSColor.System.blue)
                .frame(width: value, height: 8)

            Spacer()
        }
    }
}

struct ShadowCard: View {
    let name: String
    let shadow: ShadowStyle

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: DSRadius.md)
                .fill(Color(.systemBackground))
                .frame(width: 60, height: 60)
                .dsShadow(shadow)

            Text(name)
                .dsTextStyle(.caption)
        }
    }
}

struct ExampleRow: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: DSSpacing.md) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
                .frame(width: 32)

            Text(title)
                .dsTextStyle(.body)
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
