import SwiftUI

// MARK: - Example: Dashboard Screen

struct DSDashboardExample: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: DSSpacing.xl) {
                    // Search
                    DSSearchBar("Search transactions...", text: $searchText)

                    // Stats Cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: DSSpacing.md) {
                            DSStatCard(
                                title: "Revenue",
                                value: "$12,345",
                                change: "+12.5%",
                                isPositive: true,
                                icon: Image(systemName: "dollarsign.circle.fill"),
                                color: DSColor.System.green
                            )

                            DSStatCard(
                                title: "Users",
                                value: "1,234",
                                change: "+8.2%",
                                isPositive: true,
                                icon: Image(systemName: "person.2.fill"),
                                color: DSColor.System.blue
                            )

                            DSStatCard(
                                title: "Orders",
                                value: "567",
                                change: "-3.1%",
                                isPositive: false,
                                icon: Image(systemName: "cart.fill"),
                                color: DSColor.System.orange
                            )
                        }
                        .padding(.horizontal, DSSpacing.lg)
                    }

                    // Recent Activity
                    VStack(alignment: .leading, spacing: DSSpacing.md) {
                        HStack {
                            Text("Recent Activity")
                                .dsTextStyle(.title3)

                            Spacer()

                            Button("See All") {}
                                .dsTextStyle(.subheadline)
                        }

                        DSCard {
                            VStack(spacing: 0) {
                                DSActivityRow(
                                    icon: Image(systemName: "arrow.up.circle.fill"),
                                    title: "Payment Received",
                                    subtitle: "From Apple Inc.",
                                    amount: "+$250.00",
                                    isPositive: true
                                )

                                Divider()
                                    .padding(.leading, 44)

                                DSActivityRow(
                                    icon: Image(systemName: "arrow.down.circle.fill"),
                                    title: "Subscription",
                                    subtitle: "Netflix",
                                    amount: "-$15.99",
                                    isPositive: false
                                )

                                Divider()
                                    .padding(.leading, 44)

                                DSActivityRow(
                                    icon: Image(systemName: "arrow.up.circle.fill"),
                                    title: "Refund",
                                    subtitle: "Amazon",
                                    amount: "+$45.00",
                                    isPositive: true
                                )
                            }
                        }
                    }

                    // Quick Actions
                    VStack(alignment: .leading, spacing: DSSpacing.md) {
                        Text("Quick Actions")
                            .dsTextStyle(.title3)

                        HStack(spacing: DSSpacing.md) {
                            DSActionButton(
                                icon: Image(systemName: "plus.circle.fill"),
                                title: "Add",
                                color: DSColor.System.blue
                            )

                            DSActionButton(
                                icon: Image(systemName: "arrow.triangle.2.circlepath"),
                                title: "Transfer",
                                color: DSColor.System.green
                            )

                            DSActionButton(
                                icon: Image(systemName: "qrcode"),
                                title: "Scan",
                                color: DSColor.System.purple
                            )
                        }
                    }
                }
                .padding(.vertical, DSSpacing.lg)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Stat Card

struct DSStatCard: View {
    let title: String
    let value: String
    let change: String
    let isPositive: Bool
    let icon: Image
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            HStack {
                icon
                    .foregroundStyle(color)
                    .font(.title3)

                Spacer()

                Text(change)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(isPositive ? DSColor.System.green : DSColor.System.red)
                    .padding(.horizontal, DSSpacing.xs)
                    .padding(.vertical, DSSpacing.xxs)
                    .background((isPositive ? DSColor.System.green : DSColor.System.red).opacity(0.1))
                    .clipShape(Capsule())
            }

            Text(title)
                .dsTextStyle(.subheadline)

            Text(value)
                .dsTextStyle(.title2)
        }
        .padding(DSSpacing.lg)
        .frame(width: 160)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
    }
}

// MARK: - Activity Row

struct DSActivityRow: View {
    let icon: Image
    let title: String
    let subtitle: String
    let amount: String
    let isPositive: Bool

    var body: some View {
        HStack(spacing: DSSpacing.md) {
            icon
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(isPositive ? DSColor.System.green : DSColor.System.red)

            VStack(alignment: .leading, spacing: DSSpacing.xxs) {
                Text(title)
                    .dsTextStyle(.body)

                Text(subtitle)
                    .dsTextStyle(.caption)
            }

            Spacer()

            Text(amount)
                .dsTextStyle(.callout)
                .foregroundStyle(isPositive ? DSColor.System.green : DSColor.System.red)
        }
        .padding(.vertical, DSSpacing.sm)
    }
}

// MARK: - Action Button

struct DSActionButton: View {
    let icon: Image
    let title: String
    let color: Color

    var body: some View {
        VStack(spacing: DSSpacing.sm) {
            icon
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(color)
                .padding(DSSpacing.lg)
                .background(color.opacity(0.1))
                .clipShape(Circle())

            Text(title)
                .dsTextStyle(.caption)
        }
        .frame(maxWidth: .infinity)
        .dsPressable()
    }
}

// MARK: - Preview

#Preview {
    DSDashboardExample()
}
