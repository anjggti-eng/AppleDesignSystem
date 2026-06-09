import SwiftUI

// MARK: - DSProgressView

public enum DSProgressStyle {
    case linear
    case circular
    case segmented(Int)
}

public struct DSProgressView: View {
    let value: Double
    let total: Double
    let style: DSProgressStyle
    let label: String?
    let showsPercentage: Bool

    public init(
        value: Double,
        total: Double = 100,
        style: DSProgressStyle = .linear,
        label: String? = nil,
        showsPercentage: Bool = true
    ) {
        self.value = value
        self.total = total
        self.style = style
        self.label = label
        self.showsPercentage = showsPercentage
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            if let label = label {
                HStack {
                    Text(label)
                        .dsTextStyle(.subheadline)

                    Spacer()

                    if showsPercentage {
                        Text("\(Int((value / total) * 100))%")
                            .dsTextStyle(.subheadline)
                            .foregroundStyle(DSColor.Label.secondary)
                    }
                }
            }

            switch style {
            case .linear:
                linearView
            case .circular:
                circularView
            case .segmented(let segments):
                segmentedView(segments: segments)
            }
        }
    }

    // MARK: - Linear

    private var linearView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: DSRadius.sm)
                    .fill(DSColor.Fill.secondary)
                    .frame(height: 8)

                RoundedRectangle(cornerRadius: DSRadius.sm)
                    .fill(progressColor)
                    .frame(width: geometry.size.width * min(value / total, 1.0), height: 8)
                    .animation(.easeInOut(duration: 0.3), value: value)
            }
        }
        .frame(height: 8)
    }

    // MARK: - Circular

    private var circularView: some View {
        ZStack {
            Circle()
                .stroke(DSColor.Fill.secondary, lineWidth: 4)

            Circle()
                .trim(from: 0, to: min(value / total, 1.0))
                .stroke(progressColor, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.3), value: value)

            if showsPercentage {
                Text("\(Int((value / total) * 100))%")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
        }
        .frame(width: 44, height: 44)
    }

    // MARK: - Segmented

    private func segmentedView(segments: Int) -> some View {
        HStack(spacing: DSSpacing.xs) {
            ForEach(0..<segments, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index < Int(value / total * Double(segments)) ? progressColor : DSColor.Fill.secondary)
                    .frame(height: 4)
                    .animation(.easeInOut(duration: 0.3), value: value)
            }
        }
    }

    private var progressColor: Color {
        let percentage = value / total
        if percentage < 0.3 {
            return DSColor.System.red
        } else if percentage < 0.7 {
            return DSColor.System.orange
        } else {
            return DSColor.System.green
        }
    }
}

// MARK: - DSDownloadProgress

public struct DSDownloadProgress: View {
    let filename: String
    let progress: Double
    let fileSize: String?

    public init(
        filename: String,
        progress: Double,
        fileSize: String? = nil
    ) {
        self.filename = filename
        self.progress = progress
        self.fileSize = fileSize
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            Image(systemName: "doc.fill")
                .font(.title2)
                .foregroundStyle(DSColor.System.blue)

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(filename)
                    .dsTextStyle(.body)

                HStack {
                    DSProgressView(value: progress, showsPercentage: false)
                        .frame(maxWidth: .infinity)

                    if let fileSize = fileSize {
                        Text(fileSize)
                            .dsTextStyle(.caption)
                    }
                }

                Text("\(Int(progress))%")
                    .dsTextStyle(.caption)
                    .foregroundStyle(DSColor.Label.secondary)
            }
        }
        .padding(DSSpacing.md)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
        .dsShadow(DSShadow.sm)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 30) {
        DSProgressView(value: 65, label: "Upload Progress")

        DSProgressView(value: 30, total: 100, style: .circular)

        DSProgressView(value: 60, total: 100, style: .segmented(5), label: "Steps")

        DSDownloadProgress(
            filename: "Document.pdf",
            progress: 45,
            fileSize: "12.5 MB"
        )
    }
    .padding()
}
