<div align="center">

# AppleDesignSystem

### The Universal Design System for Apple Ecosystem

**Replicate Apple's stunning visual aesthetics on ANY platform**

![Swift](https://img.shields.io/badge/Swift-5.9+-F05138?style=for-the-badge&logo=swift)
![Platforms](https://img.shields.io/badge/Platforms-Windows%20|%20Linux%20|%20macOS%20|%20iOS%20|%20watchOS%20|%20visionOS-007AFF?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-34C759?style=for-the-badge)
![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen?style=for-the-badge&logo=swift)

---

**12 Components • 5 Modifiers • 7 Token Systems • Cross-Platform**

</div>

---

## Runs Everywhere

| Platform | Supported | Notes |
|----------|:---------:|-------|
| **Windows** | ✅ | Full support via Swift on Windows |
| **Linux** | ✅ | Full support via Swift on Linux |
| **macOS** | ✅ | Native macOS experience |
| **iOS** | ✅ | iPhone & iPad |
| **watchOS** | ✅ | Apple Watch |
| **visionOS** | ✅ | Apple Vision Pro |

> **Note:** Haptic feedback is only available on iOS/visionOS. On other platforms, haptics silently do nothing — your app still works perfectly.

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Design Tokens](#design-tokens)
- [Components](#components)
- [Modifiers](#modifiers)
- [Examples](#examples)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

---

## Features

| Feature | Description |
|---------|-------------|
| **Cross-Platform** | Works on Windows, Linux, macOS, iOS, watchOS, visionOS |
| **Design Tokens** | Semantic colors, typography, spacing, and animation parameters |
| **Glassmorphism** | Native iOS blur materials and frosted glass effects |
| **Haptic Feedback** | System-level tactile responses (iOS/visionOS only) |
| **Spring Animations** | Apple-standard elastic transitions |
| **Component Library** | 12+ production-ready UI components |
| **Dynamic Type** | Full accessibility support |
| **Dark Mode** | Automatic light/dark theme switching |
| **Zero Dependencies** | Pure SwiftUI, no external libraries |

---

## Requirements

| Dependency | Minimum Version |
|------------|-----------------|
| Swift | 5.9+ |
| iOS | 17.0+ |
| macOS | 14.0+ |
| watchOS | 10.0+ |
| visionOS | 1.0+ |
| Windows | 10+ (Swift for Windows) |
| Linux | Ubuntu 20.04+ |

---

## Installation

### Swift Package Manager (Recommended)

1. Open your project in **Xcode** (or any SPM-compatible IDE)
2. Go to **File → Add Package Dependencies...**
3. Paste the repository URL:
   ```
   https://github.com/anjggti-eng/AppleDesignSystem.git
   ```
4. Select **Up to Next Major Version** → **Add Package**
5. Select your target and click **Add Package**

### Manual Installation

1. Download or clone the repository:
   ```bash
   git clone https://github.com/anjggti-eng/AppleDesignSystem.git
   ```
2. Drag the `AppleDesignSystem` folder into your project
3. Make sure **"Copy items if needed"** is selected
4. Click **Finish**

---

## Quick Start

```swift
import SwiftUI
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        VStack(spacing: DSSpacing.lg) {
            // Button with haptic feedback
            DSButton("Continue", style: .filled) {
                print("Tapped!")
            }
            
            // Card with glassmorphism
            DSCard {
                Text("Hello World")
                    .dsTextStyle(.headline)
            }
            
            // Avatar with initials
            DSAvatar(name: "John Appleseed", size: .lg)
        }
        .padding()
    }
}
```

---

## Design Tokens

### Colors

```swift
// System Colors (Adapts to Dark Mode)
DSColor.System.blue
DSColor.System.green
DSColor.System.red
DSColor.System.orange
DSColor.System.yellow
DSColor.System.purple
DSColor.System.pink
DSColor.System.teal
DSColor.System.indigo

// Semantic Colors
DSColor.Background.primary
DSColor.Background.secondary
DSColor.Background.tertiary

DSColor.Label.primary
DSColor.Label.secondary
DSColor.Label.tertiary

DSColor.Fill.primary
DSColor.Fill.secondary
DSColor.Fill.tertiary

// Custom Hex Color
Color(hex: "#FF5733")
```

### Typography

```swift
// Style-based (Recommended)
Text("Large Title").dsTextStyle(.largeTitle)
Text("Title 1").dsTextStyle(.title1)
Text("Title 2").dsTextStyle(.title2)
Text("Title 3").dsTextStyle(.title3)
Text("Headline").dsTextStyle(.headline)
Text("Body").dsTextStyle(.body)
Text("Callout").dsTextStyle(.callout)
Text("Subheadline").dsTextStyle(.subheadline)
Text("Footnote").dsTextStyle(.footnote)
Text("Caption").dsTextStyle(.caption)

// Direct Font Access
DSTypography.largeTitle
DSTypography.body
DSTypography.rounded(.title2, weight: .bold)
```

### Spacing

```swift
// Spacing Tokens
DSSpacing.xxs  // 2pt
DSSpacing.xs   // 4pt
DSSpacing.sm   // 8pt
DSSpacing.md   // 12pt
DSSpacing.lg   // 16pt
DSSpacing.xl   // 20pt
DSSpacing.xxl  // 24pt
DSSpacing.xxxl // 32pt

// Radius Tokens
DSRadius.sm   // 8pt
DSRadius.md   // 12pt
DSRadius.lg   // 14pt
DSRadius.xl   // 16pt
DSRadius.xxl  // 20pt
DSRadius.pill // Capsule shape
```

### Animations

```swift
// Spring Animations (Apple Standard)
DSAnimation.Spring.default   // response: 0.35, damping: 0.7
DSAnimation.Spring.snappy    // response: 0.25, damping: 0.8
DSAnimation.Spring.bouncy    // response: 0.50, damping: 0.6
DSAnimation.Spring.gentle    // response: 0.45, damping: 0.85

// Duration-based
DSAnimation.easeIn
DSAnimation.easeOut
DSAnimation.easeInOut

// Usage
.animation(DSAnimation.Spring.default, value: true)
```

### Shadows

```swift
// Shadow Styles
DSShadow.sm  // y=1, blur=2, opacity=0.05
DSShadow.md  // y=2, blur=8, opacity=0.10
DSShadow.lg  // y=4, blur=16, opacity=0.15
DSShadow.xl  // y=8, blur=32, opacity=0.20

// Usage
.dsShadow(DSShadow.md)
```

### Materials

```swift
// Glassmorphism Materials
DSMaterial.ultraThin
DSMaterial.thin
DSMaterial.regular
DSMaterial.thick
DSMaterial.ultraThick

// Usage
.background(DSMaterial.regular)
```

### Haptics

```swift
// Impact Feedback
DSHaptics.impact(.light)
DSHaptics.impact(.medium)
DSHaptics.impact(.heavy)

// Notification Feedback
DSHaptics.notification(.success)
DSHaptics.notification(.warning)
DSHaptics.notification(.error)

// Predefined Patterns
DSHaptics.buttonTap()
DSHaptics.toggleSwitch()
DSHaptics.success()
```

---

## Components

### DSButton

```swift
// Styles
DSButton("Filled", style: .filled) { }
DSButton("Bordered", style: .bordered) { }
DSButton("Plain", style: .plain) { }
DSButton("Glass", style: .glass) { }
DSButton("Delete", style: .destructive) { }

// With Icon
DSButton("Sign in", icon: Image(systemName: "arrow.right")) { }

// Loading State
DSButton("Loading...", isLoading: true) { }
```

### DSCard

```swift
// Basic Card
DSCard {
    Text("Card Content")
}

// Card with Header
DSCardWithHeader(
    header: { Text("Settings") }
) {
    VStack(alignment: .leading, spacing: 12) {
        Text("Option 1")
        Text("Option 2")
    }
}
```

### DSTextField

```swift
// Basic TextField
DSTextField("Enter text", text: $text)

// With Title and Icon
DSTextField("Email", text: $email, title: "Email Address", icon: Image(systemName: "envelope"))

// Search Bar
DSSearchBar("Search...", text: $searchText)
```

### DSBadge

```swift
// Filled Badge
DSBadge("New")
DSBadge("Active", color: .green)

// Outlined Badge
DSBadge("Pending", style: .outlined, color: .orange)

// Count Badge
DSCountBadge(count: 5)
```

### DSAvatar

```swift
// Avatar Sizes
DSAvatar(name: "John Appleseed", size: .sm)
DSAvatar(name: "John Appleseed", size: .md)
DSAvatar(name: "John Appleseed", size: .lg)

// Avatar Group
DSAvatarGroup(names: ["John", "Jane", "Bob"], size: .md, maxVisible: 3)
```

### DSToggle

```swift
// Basic Toggle
DSToggle("Dark Mode", isOn: $isDarkMode)

// Toggle Card
DSToggleCard(
    title: "Wi-Fi",
    subtitle: "Home Network",
    icon: Image(systemName: "wifi"),
    isOn: $wifiEnabled
)
```

### DSSlider

```swift
// Basic Slider
DSSlider("Volume", value: $volume)

// Stepper
DSStepper("Quantity", value: $quantity, in: 1...10)
```

### DSList

```swift
DSSection(header: { Text("GENERAL") }) {
    DSListRowSimple("Wi-Fi", icon: Image(systemName: "wifi"))
    DSListRowSimple("Bluetooth", icon: Image(systemName: "antenna.radiowaves.left.and.right"))
}
```

### DSProgressView

```swift
// Linear
DSProgressView(value: 65, label: "Upload Progress")

// Circular
DSProgressView(value: 30, style: .circular)

// Segmented
DSProgressView(value: 60, style: .segmented(5))
```

### DSAlert

```swift
@State private var showAlert = false

.dsAlert(
    type: .success,
    title: "Success!",
    message: "Changes saved.",
    isPresented: $showAlert
)
```

### DSSheet

```swift
@State private var showSheet = false

.dsSheet(title: "Options", isPresented: $showSheet) {
    Text("Sheet Content")
}
```

### DSLoadingIndicator

```swift
DSLoadingIndicator(style: .spinner)
DSLoadingIndicator(style: .dots)
DSLoadingIndicator(style: .pulse)
DSLoadingIndicator(style: .progress)
```

---

## Modifiers

```swift
// Card Style
.dsCard()

// Pressable with Haptics
.dsPressable()

// Glassmorphism
.dsGlass()

// Shimmer Loading
.dsShimmer()

// Text Hierarchy
.dsTextStyle(.headline)

// Custom Shadow
.dsShadow(DSShadow.lg)
```

---

## Architecture

```
AppleDesignSystem/
├── Sources/AppleDesignSystem/
│   ├── Tokens/                    # Design tokens
│   │   ├── DSTokens.swift         # Colors (cross-platform)
│   │   ├── DSTypography.swift     # Fonts
│   │   ├── DSSpacing.swift        # Spacing & Radius
│   │   ├── DSAnimation.swift      # Animations
│   │   ├── DSShadow.swift         # Shadows
│   │   ├── DSMaterial.swift       # Glassmorphism
│   │   └── DSHaptics.swift        # Haptic feedback (cross-platform)
│   ├── Modifiers/                 # ViewModifiers
│   │   ├── DSCardModifier.swift
│   │   ├── DSPressableModifier.swift
│   │   ├── DSTextModifier.swift
│   │   ├── DSGlassModifier.swift
│   │   └── DSShimmerModifier.swift
│   └── Components/                # UI Components
│       ├── DSButton.swift
│       ├── DSCard.swift
│       ├── DSTextField.swift
│       ├── DSBadge.swift
│       ├── DSAvatar.swift
│       ├── DSToggle.swift
│       ├── DSSlider.swift
│       ├── DSList.swift
│       ├── DSProgressView.swift
│       ├── DSAlert.swift
│       ├── DSSheet.swift
│       └── DSLoadingIndicator.swift
├── Examples/                      # Example screens
├── Tests/                         # Unit tests
├── Package.swift                  # SPM manifest
├── LICENSE                        # MIT License
└── README.md                      # This file
```

---

## Contributing

1. **Fork** the repository
2. **Create** your feature branch:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit** your changes:
   ```bash
   git commit -m 'feat: add amazing feature'
   ```
4. **Push** to the branch:
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open** a Pull Request

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

### Made with passion for the Apple ecosystem

**Works on Windows • Linux • macOS • iOS • watchOS • visionOS**

[⬆ Back to Top](#appledesignsystem)

</div>
