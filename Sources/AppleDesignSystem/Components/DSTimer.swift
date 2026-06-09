import SwiftUI

// MARK: - DSTimer

public struct DSTimer: View {
    let title: String
    let icon: String
    @State private var seconds: Int = 0
    @State private var isRunning = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    public init(title: String = "Timer", icon: String = "timer") {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        VStack(spacing: DSSpacing.lg) {
            // Timer Display
            ZStack {
                Circle()
                    .stroke(DSColor.Fill.secondary, lineWidth: 8)
                    .frame(width: 120, height: 120)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(DSColor.System.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: seconds)

                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundStyle(DSColor.System.blue)
                        .accessibilityHidden(true)

                    Text(formattedTime)
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundStyle(DSColor.Label.primary)
                        .accessibilityLabel("Tempo: \(formattedTime)")
                }
            }

            // Controls
            HStack(spacing: DSSpacing.xl) {
                // Reset
                Button(action: {
                    DSHaptics.impact(.light)
                    withAnimation {
                        seconds = 0
                        isRunning = false
                    }
                }) {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title2)
                        .foregroundStyle(DSColor.Label.secondary)
                        .frame(width: 44, height: 44)
                        .background(DSColor.Fill.tertiary)
                        .clipShape(Circle())
                }
                .accessibilityLabel("Resetar")

                // Play/Pause
                Button(action: {
                    DSHaptics.impact(.medium)
                    isRunning.toggle()
                }) {
                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 64, height: 64)
                        .background(isRunning ? DSColor.System.orange : DSColor.System.green)
                        .clipShape(Circle())
                }
                .accessibilityLabel(isRunning ? "Pausar" : "Iniciar")

                // Stop
                Button(action: {
                    DSHaptics.impact(.heavy)
                    withAnimation {
                        seconds = 0
                        isRunning = false
                    }
                }) {
                    Image(systemName: "stop.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(DSColor.System.red)
                        .clipShape(Circle())
                }
                .accessibilityLabel("Parar")
            }
        }
        .padding(DSSpacing.xl)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.xl, style: .continuous))
        .dsShadow(DSShadow.md)
        .onReceive(timer) { _ in
            guard isRunning else { return }
            seconds += 1
        }
    }

    private var formattedTime: String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }

    private var progress: CGFloat {
        guard seconds > 0 else { return 0 }
        return CGFloat(seconds % 60) / 60.0
    }
}

// MARK: - DSClock

public struct DSClock: View {
    @State private var time = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    public init() {}

    public var body: some View {
        VStack(spacing: DSSpacing.sm) {
            Text(time, style: .time)
                .font(.system(size: 48, weight: .thin, design: .rounded))
                .foregroundStyle(DSColor.Label.primary)
                .contentTransition(.numericText())
                .animation(.default, value: time)

            Text(time, style: .date)
                .dsTextStyle(.subheadline)
                .foregroundStyle(DSColor.Label.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(DSSpacing.xl)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.xl, style: .continuous))
        .onReceive(timer) { input in
            time = input
        }
    }
}

// MARK: - DSStopwatch

public struct DSStopwatch: View {
    @State private var elapsedTime: TimeInterval = 0
    @State private var isRunning = false
    @State private var laps: [TimeInterval] = []
    @State private var startTime: Date?
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    public init() {}

    public var body: some View {
        VStack(spacing: DSSpacing.lg) {
            // Time Display
            Text(formattedTime(elapsedTime))
                .font(.system(size: 56, weight: .thin, design: .monospaced))
                .foregroundStyle(DSColor.Label.primary)
                .contentTransition(.numericText())
                .accessibilityLabel("Tempo: \(formattedTime(elapsedTime))")

            // Controls
            HStack(spacing: DSSpacing.xl) {
                Button(action: {
                    DSHaptics.impact(.light)
                    if isRunning {
                        laps.append(elapsedTime)
                    } else {
                        startTime = Date()
                    }
                    isRunning.toggle()
                }) {
                    Text(isRunning ? "Volta" : "Iniciar")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 44)
                        .background(isRunning ? DSColor.System.orange : DSColor.System.green)
                        .clipShape(Capsule())
                }

                Button(action: {
                    DSHaptics.impact(.heavy)
                    withAnimation {
                        isRunning = false
                        elapsedTime = 0
                        laps.removeAll()
                    }
                }) {
                    Text("Parar")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 44)
                        .background(DSColor.System.red)
                        .clipShape(Capsule())
                }
            }

            // Laps
            if !laps.isEmpty {
                VStack(spacing: 0) {
                    HStack {
                        Text("Volta")
                            .dsTextStyle(.caption)
                        Spacer()
                        Text("Tempo")
                            .dsTextStyle(.caption)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, DSSpacing.sm)
                    .background(DSColor.Fill.tertiary)

                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(Array(laps.enumerated()), id: \.offset) { index, lap in
                                HStack {
                                    Text("\(index + 1)")
                                        .dsTextStyle(.body)
                                    Spacer()
                                    Text(formattedTime(lap))
                                        .dsTextStyle(.body)
                                        .foregroundStyle(DSColor.Label.secondary)
                                }
                                .padding(.horizontal)
                                .padding(.vertical, DSSpacing.sm)

                                if index < laps.count - 1 {
                                    Divider()
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg, style: .continuous))
            }
        }
        .padding(DSSpacing.xl)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.xl, style: .continuous))
        .dsShadow(DSShadow.md)
        .onReceive(timer) { _ in
            guard isRunning, let startTime = startTime else { return }
            elapsedTime = Date().timeIntervalSince(startTime)
        }
    }

    private func formattedTime(_ time: TimeInterval) -> String {
        let mins = Int(time) / 60
        let secs = Int(time) % 60
        let hundredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02d:%02d.%02d", mins, secs, hundredths)
    }
}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: 20) {
            DSTimer()
            DSClock()
            DSStopwatch()
        }
        .padding()
    }
}
