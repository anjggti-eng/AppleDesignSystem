import SwiftUI

// MARK: - DSSheet

public enum DSSheetDetent {
    case small
    case medium
    case large
    case custom(CGFloat)

    var height: CGFloat? {
        switch self {
        case .small: return 200
        case .medium: return 400
        case .large: return nil
        case .custom(let height): return height
        }
    }
}

public struct DSSheet<Content: View>: View {
    let title: String?
    let detent: DSSheetDetent
    let showsDismissButton: Bool
    let content: Content

    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 0

    public init(
        title: String? = nil,
        detent: DSSheetDetent = .medium,
        showsDismissButton: Bool = true,
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.detent = detent
        self.showsDismissButton = showsDismissButton
        self._isPresented = isPresented
        self.content = content()
    }

    public var body: some View {
        ZStack {
            if isPresented {
                // Background
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                            isPresented = false
                        }
                    }

                // Sheet
                VStack(spacing: 0) {
                    // Handle
                    Capsule()
                        .fill(DSColor.Fill.secondary)
                        .frame(width: 40, height: 5)
                        .padding(.top, DSSpacing.sm)

                    // Header
                    if let title = title, showsDismissButton {
                        headerView(title: title)
                    } else if let title = title {
                        Text(title)
                            .dsTextStyle(.headline)
                            .padding(.top, DSSpacing.lg)
                    }

                    // Content
                    content
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity)
                .frame(height: detent.height)
                .background(Color(.systemBackground))
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: DSRadius.xl, topTrailingRadius: DSRadius.xl))
                .dsShadow(DSShadow.xl)
                .offset(y: max(offset, 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.height > 0 {
                                offset = value.translation.height
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 100 {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                    isPresented = false
                                }
                            } else {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                    offset = 0
                                }
                            }
                        }
                )
                .transition(.move(edge: .bottom))
                .animation(.spring(response: 0.35, dampingFraction: 0.7), value: isPresented)
            }
        }
    }

    private func headerView(title: String) -> some View {
        HStack {
            Text(title)
                .dsTextStyle(.headline)

            Spacer()

            if showsDismissButton {
                Button(action: {
                    DSHaptics.impact(.light)
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                        isPresented = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(DSColor.Label.tertiary)
                }
            }
        }
        .padding(.horizontal, DSSpacing.lg)
        .padding(.top, DSSpacing.lg)
    }
}

// MARK: - DSSheetModifier

public struct DSSheetModifier<SheetContent: View>: ViewModifier {
    let title: String?
    let detent: DSSheetDetent
    @Binding var isPresented: Bool
    let content: () -> SheetContent

    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                DSSheet(title: title, detent: detent, isPresented: $isPresented) {
                    self.content()
                }
            }
    }
}

extension View {
    public func dsSheet<Content: View>(
        title: String? = nil,
        detent: DSSheetDetent = .medium,
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(DSSheetModifier(title: title, detent: detent, isPresented: isPresented, content: content))
    }
}

// MARK: - DSConfirmationSheet

public struct DSConfirmationSheet: View {
    let title: String
    let message: String
    let confirmTitle: String
    let cancelTitle: String
    let isDestructive: Bool
    let onConfirm: () -> Void
    let onCancel: () -> Void

    @Binding var isPresented: Bool

    public init(
        title: String,
        message: String,
        confirmTitle: String = "Confirm",
        cancelTitle: String = "Cancel",
        isDestructive: Bool = false,
        isPresented: Binding<Bool>,
        onConfirm: @escaping () -> Void,
        onCancel: @escaping () -> Void = {}
    ) {
        self.title = title
        self.message = message
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.isDestructive = isDestructive
        self._isPresented = isPresented
        self.onConfirm = onConfirm
        self.onCancel = onCancel
    }

    public var body: some View {
        VStack(spacing: DSSpacing.lg) {
            Text(title)
                .dsTextStyle(.title3)

            Text(message)
                .dsTextStyle(.body)
                .foregroundStyle(DSColor.Label.secondary)
                .multilineTextAlignment(.center)

            HStack(spacing: DSSpacing.md) {
                DSButton(cancelTitle, style: .bordered) {
                    DSHaptics.impact(.light)
                    withAnimation {
                        isPresented = false
                    }
                    onCancel()
                }

                DSButton(confirmTitle, style: isDestructive ? .destructive : .filled) {
                    DSHaptics.impact(.medium)
                    withAnimation {
                        isPresented = false
                    }
                    onConfirm()
                }
            }
        }
        .padding(DSSpacing.xl)
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var showSheet = false

    return VStack {
        DSButton("Show Sheet") {
            showSheet = true
        }
    }
    .dsSheet(title: "Options", isPresented: $showSheet) {
        VStack(spacing: DSSpacing.md) {
            Text("Sheet Content")
                .dsTextStyle(.headline)
        }
        .padding()
    }
}
