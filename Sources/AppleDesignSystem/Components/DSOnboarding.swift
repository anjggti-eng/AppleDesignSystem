import SwiftUI

// MARK: - DSOnboarding

public struct DSOnboardingItem: Identifiable {
    public let id = UUID()
    let icon: String
    let iconColor: Color
    let title: String
    let description: String

    public init(icon: String, iconColor: Color = DSColor.System.blue, title: String, description: String) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.description = description
    }
}

public struct DSOnboarding: View {
    let items: [DSOnboardingItem]
    let onContinue: () -> Void

    @State private var currentPage = 0

    public init(
        items: [DSOnboardingItem],
        onContinue: @escaping () -> Void
    ) {
        self.items = items
        self.onContinue = onContinue
    }

    public var body: some View {
        VStack(spacing: DSSpacing.xl) {
            // Page Indicator
            HStack(spacing: DSSpacing.sm) {
                ForEach(0..<items.count, id: \.self) { index in
                    Capsule()
                        .fill(index == currentPage ? DSColor.System.blue : DSColor.Fill.secondary)
                        .frame(width: index == currentPage ? 24 : 8, height: 8)
                        .animation(.spring(response: 0.3), value: currentPage)
                }
            }
            .padding(.top, DSSpacing.xxl)

            // Content
            TabView(selection: $currentPage) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    VStack(spacing: DSSpacing.xl) {
                        Spacer()

                        // Icon
                        Image(systemName: item.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(item.iconColor)
                            .padding(DSSpacing.xxl)
                            .background(item.iconColor.opacity(0.1))
                            .clipShape(Circle())
                            .accessibilityHidden(true)

                        // Text
                        VStack(spacing: DSSpacing.md) {
                            Text(item.title)
                                .dsTextStyle(.largeTitle)
                                .multilineTextAlignment(.center)
                                .accessibilityAddTraits(.isHeader)

                            Text(item.description)
                                .dsTextStyle(.body)
                                .foregroundStyle(DSColor.Label.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, DSSpacing.xl)
                        }

                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            // Button
            DSButton(
                currentPage < items.count - 1 ? "Continuar" : "Começar",
                style: .filled,
                accessibilityHint: currentPage < items.count - 1 ? "Ir para a próxima página" : "Finalizar introdução"
            ) {
                DSHaptics.impact(.medium)
                if currentPage < items.count - 1 {
                    withAnimation {
                        currentPage += 1
                    }
                } else {
                    onContinue()
                }
            }
            .padding(.horizontal, DSSpacing.xl)
            .padding(.bottom, DSSpacing.xxl)
        }
    }
}

// MARK: - DSOnboardingCard

public struct DSOnboardingCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color

    public init(
        icon: String,
        title: String,
        description: String,
        color: Color = DSColor.System.blue
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.color = color
    }

    public var body: some View {
        HStack(spacing: DSSpacing.lg) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
                .frame(width: 48, height: 48)
                .background(color.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.md, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(title)
                    .dsTextStyle(.headline)

                Text(description)
                    .dsTextStyle(.subheadline)
                    .foregroundStyle(DSColor.Label.secondary)
                    .lineLimit(2)
            }
        }
        .padding(DSSpacing.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - DSFeatureHighlight

public struct DSFeatureHighlight: View {
    let icon: String
    let title: String
    let description: String
    let color: Color

    public init(
        icon: String,
        title: String,
        description: String,
        color: Color = DSColor.System.blue
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.color = color
    }

    public var body: some View {
        VStack(spacing: DSSpacing.md) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
                .foregroundStyle(color)
                .accessibilityHidden(true)

            Text(title)
                .dsTextStyle(.headline)
                .multilineTextAlignment(.center)

            Text(description)
                .dsTextStyle(.subheadline)
                .foregroundStyle(DSColor.Label.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(DSSpacing.xl)
    }
}

// MARK: - Preview

#Preview {
    DSOnboarding(items: [
        DSOnboardingItem(icon: "sparkles", iconColor: DSColor.System.purple, title: "Bem-vindo", description: "Descubra uma nova forma de organizar suas tarefas"),
        DSOnboardingItem(icon: "bell.badge.fill", iconColor: DSColor.System.red, title: "Notificações", description: "Receba lembretes inteligentes no momento certo"),
        DSOnboardingItem(icon: "chart.bar.fill", iconColor: DSColor.System.green, title: "Progresso", description: "Acompanhe seu desempenho com gráficos detalhados")
    ]) {
        print("Onboarding concluído")
    }
}
