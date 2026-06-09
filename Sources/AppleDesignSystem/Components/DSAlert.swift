import SwiftUI

// MARK: - DSAlert

public enum DSAlertType {
    case info
    case success
    case warning
    case error
}

public struct DSAlert: View {
    let type: DSAlertType
    let title: String
    let message: String
    let primaryAction: String
    let secondaryAction: String?
    let onPrimary: () -> Void
    let onSecondary: (() -> Void)?

    @Binding var isPresented: Bool

    public init(
        type: DSAlertType = .info,
        title: String,
        message: String,
        primaryAction: String = "OK",
        secondaryAction: String? = nil,
        isPresented: Binding<Bool>,
        onPrimary: @escaping () -> Void = {},
        onSecondary: (() -> Void)? = nil
    ) {
        self.type = type
        self.title = title
        self.message = message
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self._isPresented = isPresented
        self.onPrimary = onPrimary
        self.onSecondary = onSecondary
    }

    public var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }

            VStack(spacing: DSSpacing.lg) {
                // Icon
                Image(systemName: icon_name)
                    .font(.system(size: 44))
                    .foregroundStyle(iconColor)

                // Title
                Text(title)
                    .dsTextStyle(.title2)
                    .multilineTextAlignment(.center)

                // Message
                Text(message)
                    .dsTextStyle(.body)
                    .foregroundStyle(DSColor.Label.secondary)
                    .multilineTextAlignment(.center)

                // Buttons
                VStack(spacing: DSSpacing.sm) {
                    DSButton(primaryAction, style: .filled) {
                        DSHaptics.impact(.light)
                        withAnimation {
                            isPresented = false
                        }
                        onPrimary()
                    }

                    if let secondaryAction = secondaryAction {
                        DSButton(secondaryAction, style: .plain) {
                            DSHaptics.impact(.light)
                            withAnimation {
                                isPresented = false
                            }
                            onSecondary?()
                        }
                    }
                }
            }
            .padding(DSSpacing.xl)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.xl, style: .continuous))
            .dsShadow(DSShadow.xl)
            .padding(DSSpacing.xl)
        }
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.2), value: isPresented)
    }

    private var icon_name: String {
        switch type {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }

    private var iconColor: Color {
        switch type {
        case .info: return DSColor.System.blue
        case .success: return DSColor.System.green
        case .warning: return DSColor.System.orange
        case .error: return DSColor.System.red
        }
    }
}

// MARK: - DSAlertModifier

public struct DSAlertModifier: ViewModifier {
    let type: DSAlertType
    let title: String
    let message: String
    let primaryAction: String
    let secondaryAction: String?
    @Binding var isPresented: Bool
    let onPrimary: () -> Void
    let onSecondary: (() -> Void)?

    public func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isPresented {
                        DSAlert(
                            type: type,
                            title: title,
                            message: message,
                            primaryAction: primaryAction,
                            secondaryAction: secondaryAction,
                            isPresented: $isPresented,
                            onPrimary: onPrimary,
                            onSecondary: onSecondary
                        )
                    }
                }
            )
    }
}

extension View {
    public func dsAlert(
        type: DSAlertType = .info,
        title: String,
        message: String,
        primaryAction: String = "OK",
        secondaryAction: String? = nil,
        isPresented: Binding<Bool>,
        onPrimary: @escaping () -> Void = {},
        onSecondary: (() -> Void)? = nil
    ) -> some View {
        modifier(DSAlertModifier(
            type: type,
            title: title,
            message: message,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            isPresented: isPresented,
            onPrimary: onPrimary,
            onSecondary: onSecondary
        ))
    }
}

// MARK: - DSErrorAlert

public struct DSErrorAlert: View {
    let error: Error
    let buttonTitle: String
    @Binding var isPresented: Bool

    public init(
        error: Error,
        buttonTitle: String = "OK",
        isPresented: Binding<Bool>
    ) {
        self.error = error
        self.buttonTitle = buttonTitle
        self._isPresented = isPresented
    }

    public var body: some View {
        DSAlert(
            type: .error,
            title: "Error",
            message: error.localizedDescription,
            primaryAction: buttonTitle,
            isPresented: $isPresented
        )
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var showAlert = true

    return VStack(spacing: 20) {
        DSButton("Show Alert") {
            showAlert = true
        }
    }
    .dsAlert(
        type: .success,
        title: "Success!",
        message: "Your changes have been saved successfully.",
        isPresented: $showAlert
    )
}
