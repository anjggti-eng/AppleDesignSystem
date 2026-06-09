import SwiftUI

// MARK: - Example: Login Screen

struct DSLoginExample: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DSSpacing.xl) {
                    // Header
                    VStack(spacing: DSSpacing.sm) {
                        Image(systemName: "apple.logo")
                            .font(.system(size: 48))
                            .foregroundStyle(DSColor.Label.primary)

                        Text("Welcome Back")
                            .dsTextStyle(.largeTitle)

                        Text("Sign in to continue")
                            .dsTextStyle(.subheadline)
                    }
                    .padding(.top, DSSpacing.xxxl)

                    // Form
                    VStack(spacing: DSSpacing.lg) {
                        DSTextField(
                            "Email",
                            text: $email,
                            title: "Email Address",
                            icon: Image(systemName: "envelope")
                        )

                        DSTextField(
                            "Password",
                            text: $password,
                            title: "Password",
                            icon: Image(systemName: "lock"),
                            isSecure: true
                        )

                        HStack {
                            Spacer()
                            Button("Forgot Password?") {}
                                .dsTextStyle(.subheadline)
                        }
                    }

                    // Buttons
                    VStack(spacing: DSSpacing.md) {
                        DSButton("Sign In", style: .filled, isLoading: isLoading) {
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                            }
                        }

                        DSButton("Sign in with Apple", icon: Image(systemName: "apple.logo"), style: .glass) {}
                    }

                    // Footer
                    HStack(spacing: DSSpacing.xs) {
                        Text("Don't have an account?")
                            .dsTextStyle(.subheadline)

                        Button("Sign Up") {}
                            .dsTextStyle(.subheadline)
                    }
                }
                .padding(.horizontal, DSSpacing.lg)
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

// MARK: - Preview

#Preview {
    DSLoginExample()
}
