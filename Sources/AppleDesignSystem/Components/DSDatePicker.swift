import SwiftUI

// MARK: - DSDatePicker

public enum DSDatePickerStyle {
    case compact
    case graphical
    case wheel
}

public struct DSDatePicker: View {
    let title: String
    let icon: String
    let style: DSDatePickerStyle
    @Binding var selection: Date
    let range: ClosedRange<Date>?

    public init(
        _ title: String,
        selection: Binding<Date>,
        icon: String = "calendar",
        style: DSDatePickerStyle = .compact,
        in range: ClosedRange<Date>? = nil
    ) {
        self.title = title
        self._selection = selection
        self.icon = icon
        self.style = style
        self.range = range
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            HStack(spacing: DSSpacing.sm) {
                Image(systemName: icon)
                    .foregroundStyle(DSColor.System.blue)
                    .accessibilityHidden(true)

                Text(title)
                    .dsTextStyle(.body)

                Spacer()
            }

            switch style {
            case .compact:
                if let range = range {
                    DatePicker("", selection: $selection, in: range, displayedComponents: .date)
                        .labelsHidden()
                } else {
                    DatePicker("", selection: $selection, displayedComponents: .date)
                        .labelsHidden()
                }

            case .graphical:
                if let range = range {
                    DatePicker("", selection: $selection, in: range, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                } else {
                    DatePicker("", selection: $selection, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }

            case .wheel:
                if let range = range {
                    DatePicker("", selection: $selection, in: range, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                } else {
                    DatePicker("", selection: $selection, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                }
            }
        }
        .padding(DSSpacing.lg)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title): \(selection.formatted(date: .long, time: .omitted))"))
    }
}

// MARK: - DSDatePickerRow

public struct DSDatePickerRow: View {
    let title: String
    let icon: String
    @Binding var date: Date

    public init(_ title: String, date: Binding<Date>, icon: String = "calendar") {
        self.title = title
        self._date = date
        self.icon = icon
    }

    public var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(DSColor.System.blue)
                .frame(width: 24)
                .accessibilityHidden(true)

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            Text(date.formatted(date: .abbreviated, time: .omitted))
                .dsTextStyle(.subheadline)
                .foregroundStyle(DSColor.Label.secondary)
        }
        .padding(.vertical, DSSpacing.sm)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            DSDatePicker("Select Date", selection: .constant(Date()))
            DSDatePicker("Graphical", selection: .constant(Date()), style: .graphical)
            DSDatePicker("Wheel", selection: .constant(Date()), style: .wheel)
        }
        .padding()
    }
}
