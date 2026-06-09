import SwiftUI

// MARK: - DSSlider

public enum DSSliderStyle {
    case `default`
    case gradient
    case custom(Color)
}

public struct DSSlider: View {
    let title: String?
    let icon: Image?
    let style: DSSliderStyle
    let range: ClosedRange<Double>
    let step: Double

    @Binding var value: Double

    public init(
        _ title: String? = nil,
        value: Binding<Double>,
        in range: ClosedRange<Double> = 0...100,
        step: Double = 1,
        icon: Image? = nil,
        style: DSSliderStyle = .default
    ) {
        self.title = title
        self._value = value
        self.range = range
        self.step = step
        self.icon = icon
        self.style = style
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            if let title = title {
                HStack {
                    if let icon = icon {
                        icon
                            .foregroundStyle(DSColor.System.blue)
                    }

                    Text(title)
                        .dsTextStyle(.subheadline)

                    Spacer()

                    Text("\(Int(value))")
                        .dsTextStyle(.subheadline)
                        .foregroundStyle(DSColor.Label.secondary)
                }
            }

            Slider(value: $value, in: range, step: step)
                .tint(sliderColor)
                .onChange(of: value) { _, _ in
                    DSHaptics.impact(.light)
                }
        }
    }

    private var sliderColor: Color {
        switch style {
        case .default:
            return DSColor.System.blue
        case .gradient:
            return DSColor.System.blue
        case .custom(let color):
            return color
        }
    }
}

// MARK: - DSStepper

public struct DSStepper: View {
    let title: String
    let icon: Image?
    let range: ClosedRange<Int>

    @Binding var value: Int

    public init(
        _ title: String,
        value: Binding<Int>,
        in range: ClosedRange<Int> = 0...100,
        icon: Image? = nil
    ) {
        self.title = title
        self._value = value
        self.range = range
        self.icon = icon
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(DSColor.System.blue)
            }

            Text(title)
                .dsTextStyle(.body)

            Spacer()

            HStack(spacing: DSSpacing.sm) {
                Button(action: {
                    if value > range.lowerBound {
                        value -= 1
                        DSHaptics.impact(.light)
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(value > range.lowerBound ? DSColor.System.red : DSColor.Label.tertiary)
                }
                .disabled(value <= range.lowerBound)

                Text("\(value)")
                    .font(.headline)
                    .frame(width: 40)

                Button(action: {
                    if value < range.upperBound {
                        value += 1
                        DSHaptics.impact(.light)
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(value < range.upperBound ? DSColor.System.green : DSColor.Label.tertiary)
                }
                .disabled(value >= range.upperBound)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        DSSlider("Brightness", value: .constant(75), icon: Image(systemName: "sun.max.fill"))

        DSSlider("Volume", value: .constant(50), style: .gradient)

        DSStepper("Quantity", value: .constant(1), icon: Image(systemName: "cart.fill"))
    }
    .padding()
}
