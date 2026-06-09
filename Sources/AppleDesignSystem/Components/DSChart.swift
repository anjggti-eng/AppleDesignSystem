import SwiftUI

// MARK: - DSBarChart

public struct DSBarChart: View {
    let data: [Double]
    let labels: [String]
    let color: Color
    let maxValue: Double?

    public init(
        data: [Double],
        labels: [String] = [],
        color: Color = DSColor.System.blue,
        maxValue: Double? = nil
    ) {
        self.data = data
        self.labels = labels
        self.color = color
        self.maxValue = maxValue
    }

    private var maximum: Double {
        maxValue ?? (data.max() ?? 1)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            // Chart
            HStack(alignment: .bottom, spacing: DSSpacing.sm) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    VStack(spacing: DSSpacing.xs) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(color.gradient)
                            .frame(height: max(4, CGFloat(value / maximum) * 150))
                            .frame(maxWidth: .infinity)
                            .accessibilityLabel(labels.indices.contains(index) ? "\(labels[index]): \(Int(value))" : "Valor: \(Int(value))")

                        if labels.indices.contains(index) {
                            Text(labels[index])
                                .font(.caption2)
                                .foregroundStyle(DSColor.Label.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
        }
        .padding(DSSpacing.lg)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Gráfico de barras com \(data.count) valores")
    }
}

// MARK: - DSLineChart

public struct DSLineChart: View {
    let data: [Double]
    let color: Color
    let showDots: Bool
    let showGradient: Bool

    public init(
        data: [Double],
        color: Color = DSColor.System.blue,
        showDots: Bool = true,
        showGradient: Bool = true
    ) {
        self.data = data
        self.color = color
        self.showDots = showDots
        self.showGradient = showGradient
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxValue = data.max() ?? 1
            let minValue = data.min() ?? 0
            let range = maxValue - minValue
            let width = geometry.size.width
            let height = geometry.size.height
            let stepX = width / CGFloat(max(data.count - 1, 1))

            ZStack {
                // Gradient fill
                if showGradient {
                    LinearGradient(
                        colors: [color.opacity(0.3), color.opacity(0.0)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .clipShape(
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: height))
                            for (index, value) in data.enumerated() {
                                let x = CGFloat(index) * stepX
                                let y = height - ((CGFloat(value - minValue) / CGFloat(range)) * height * 0.85)
                                if index == 0 {
                                    path.addLine(to: CGPoint(x: x, y: y))
                                } else {
                                    path.addLine(to: CGPoint(x: x, y: y))
                                }
                            }
                            path.addLine(to: CGPoint(x: width, y: height))
                            path.closeSubpath()
                        }
                    )
                }

                // Line
                Path { path in
                    for (index, value) in data.enumerated() {
                        let x = CGFloat(index) * stepX
                        let y = height - ((CGFloat(value - minValue) / CGFloat(range)) * height * 0.85)
                        if index == 0 {
                            path.move(to: CGPoint(x: x, y: y))
                        } else {
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                }
                .stroke(color, style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))

                // Dots
                if showDots {
                    ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                        let x = CGFloat(index) * stepX
                        let y = height - ((CGFloat(value - minValue) / CGFloat(range)) * height * 0.85)

                        Circle()
                            .fill(color)
                            .frame(width: 8, height: 8)
                            .overlay(
                                Circle()
                                    .fill(Color(.systemBackground))
                                    .frame(width: 4, height: 4)
                            )
                            .position(x: x, y: y)
                    }
                }
            }
        }
        .frame(height: 150)
        .padding(DSSpacing.lg)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Gráfico de linhas com \(data.count) valores")
    }
}

// MARK: - DSCircularProgress

public struct DSCircularProgress: View {
    let value: Double
    let total: Double
    let color: Color
    let lineWidth: CGFloat
    let size: CGFloat
    let label: String?

    public init(
        value: Double,
        total: Double = 100,
        color: Color = DSColor.System.blue,
        lineWidth: CGFloat = 8,
        size: CGFloat = 80,
        label: String? = nil
    ) {
        self.value = value
        self.total = total
        self.color = color
        self.lineWidth = lineWidth
        self.size = size
        self.label = label
    }

    private var progress: Double {
        min(value / total, 1.0)
    }

    public var body: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(color.opacity(0.2), lineWidth: lineWidth)

            // Progress circle
            Circle()
                .trim(from: 0, to: progress)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: value)

            // Value text
            VStack(spacing: 2) {
                Text("\(Int(progress * 100))%")
                    .font(.system(size: size * 0.2, weight: .bold, design: .rounded))
                    .foregroundStyle(DSColor.Label.primary)

                if let label = label {
                    Text(label)
                        .font(.system(size: size * 0.1, design: .rounded))
                        .foregroundStyle(DSColor.Label.secondary)
                }
            }
        }
        .frame(width: size, height: size)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(label ?? "Progresso"))
        .accessibilityValue(Text("\(Int(progress * 100)) por cento"))
    }
}

// MARK: - DSMiniChart

public struct DSMiniChart: View {
    let data: [Double]
    let color: Color

    public init(data: [Double], color: Color = DSColor.System.blue) {
        self.data = data
        self.color = color
    }

    public var body: some View {
        GeometryReader { geometry in
            let maxValue = data.max() ?? 1
            let minValue = data.min() ?? 0
            let range = maxValue - minValue
            let stepX = geometry.size.width / CGFloat(max(data.count - 1, 1))

            Path { path in
                for (index, value) in data.enumerated() {
                    let x = CGFloat(index) * stepX
                    let y = geometry.size.height - ((CGFloat(value - minValue) / CGFloat(range)) * geometry.size.height * 0.85)
                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(color, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round))
        }
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            DSBarChart(
                data: [20, 45, 30, 60, 80, 50, 70],
                labels: ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
                color: DSColor.System.blue
            )

            DSLineChart(
                data: [10, 25, 15, 40, 35, 50, 45, 60],
                color: DSColor.System.green
            )

            HStack {
                DSCircularProgress(value: 75, color: DSColor.System.blue, label: "Progress")
                DSCircularProgress(value: 45, color: DSColor.System.green, size: 100)
                DSCircularProgress(value: 90, color: DSColor.System.purple, size: 80)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}
