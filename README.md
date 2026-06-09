# AppleDesignSystem

[![Swift 5.9+](https://img.shields.io/badge/Swift-5.9+-F05138.svg)](https://swift.org)
[![iOS 17+](https://img.shields.io/badge/iOS-17+-007AFF.svg)](https://developer.apple.com/ios/)
[![macOS 14+](https://img.shields.io/badge/macOS-14+-007AFF.svg)](https://developer.apple.com/macos/)
[![visionOS 1+](https://img.shields.io/badge/visionOS-1+-007AFF.svg)](https://developer.apple.com/visionos/)
[![License: MIT](https://img.shields.io/badge/License-MIT-34C759.svg)](LICENSE)
[![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-34C759.svg)](https://swift.org/package-manager/)

<div align="center">

A professional design system replicating Apple's ecosystem aesthetics, built entirely in SwiftUI.

**12 Components • 5 Modifiers • 7 Token Systems • 100% SwiftUI**

</div>

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Design Tokens](#design-tokens)
  - [Colors](#colors)
  - [Typography](#typography)
  - [Spacing](#spacing)
  - [Animations](#animations)
  - [Shadows](#shadows)
  - [Materials](#materials)
  - [Haptics](#haptics)
- [Components](#components)
  - [DSButton](#dsbutton)
  - [DSCard](#dscard)
  - [DSTextField](#dstextfield)
  - [DSBadge](#dsbadge)
  - [DSAvatar](#dsavatar)
  - [DSToggle](#dstoggle)
  - [DSSlider](#dsslider)
  - [DSList](#dslist)
  - [DSProgressView](#dsprogressview)
  - [DSAlert](#dsalert)
  - [DSSheet](#dssheet)
  - [DSLoadingIndicator](#dsloadingindicator)
- [Modifiers](#modifiers)
- [Examples](#examples)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

---

## Features

| Feature | Description |
|---------|-------------|
| **Design Tokens** | Semantic colors, typography, spacing, and animation parameters |
| **Glassmorphism** | Native iOS blur materials and frosted glass effects |
| **Haptic Feedback** | System-level tactile responses for all interactions |
| **Spring Animations** | Apple-standard elastic transitions |
| **Component Library** | 12+ production-ready UI components |
| **Dynamic Type** | Full accessibility support |
| **Dark Mode** | Automatic light/dark theme switching |
| **Zero Dependencies** | Pure SwiftUI, no external libraries |

---

## Requirements

| Dependency | Minimum Version |
|------------|-----------------|
| iOS | 17.0+ |
| macOS | 14.0+ |
| visionOS | 1.0+ |
| Swift | 5.9+ |
| Xcode | 15.0+ |

---

## Installation

### Swift Package Manager (Recommended)

1. Open your project in **Xcode**
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
2. Drag the `AppleDesignSystem` folder into your Xcode project
3. Make **"Copy items if needed"** is selected
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

// Custom Materials
DSMaterial.frosted(tint: .white.opacity(0.1))
DSMaterial.card
DSMaterial.navigationBar

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

// Selection Feedback
DSHaptics.selection()

// Predefined Patterns
DSHaptics.buttonTap()
DSHaptics.toggleSwitch()
DSHaptics.success()
DSHaptics.error()
```

---

## Components

### DSButton

A fully-featured button with multiple styles and haptic feedback.

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

// Sizes
DSButton("Small", size: .small) { }
DSButton("Medium", size: .medium) { }
DSButton("Large", size: .large) { }
```

### DSCard

Card containers with multiple styles.

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

// Card Styles
DSCard(style: .elevated) { }
DSCard(style: .grouped) { }
DSCard(style: .inset) { }
DSCard(style: .plain) { }
```

### DSTextField

Input fields with validation and search support.

```swift
// Basic TextField
DSTextField("Enter text", text: $text)

// With Title and Icon
DSTextField(
    "Email",
    text: $email,
    title: "Email Address",
    icon: Image(systemName: "envelope")
)

// Secure Field
DSTextField("Password", text: $password, isSecure: true)

// Search Bar
DSSearchBar("Search...", text: $searchText)

// With Clear Button (automatic)
DSTextField("Type here", text: $text)
```

### DSBadge

Status badges with multiple variants.

```swift
// Filled Badge
DSBadge("New")
DSBadge("Active", color: .green)
DSBadge("Error", color: .red)

// Outlined Badge
DSBadge("Pending", style: .outlined, color: .orange)

// Dot Badge
DSBadge("", style: .dot)

// Count Badge
DSCountBadge(count: 5)
DSCountBadge(count: 150) // Shows "99+"
```

### DSAvatar

User avatars with initials fallback.

```swift
// Avatar Sizes
DSAvatar(name: "John Appleseed", size: .xs)
DSAvatar(name: "John Appleseed", size: .sm)
DSAvatar(name: "John Appleseed", size: .md)
DSAvatar(name: "John Appleseed", size: .lg)
DSAvatar(name: "John Appleseed", size: .xl)

// With Image URL
DSAvatar(name: "John", imageUrl: "https://example.com/photo.jpg")

// Avatar Group
DSAvatarGroup(
    names: ["John", "Jane", "Bob", "Alice"],
    size: .md,
    maxVisible: 3
)
```

### DSToggle

Toggle with haptic feedback.

```swift
// Basic Toggle
DSToggle("Dark Mode", isOn: $isDarkMode)

// With Icon
DSToggle(
    "Notifications",
    icon: Image(systemName: "bell.fill"),
    isOn: $notificationsEnabled
)

// Toggle Card
DSToggleCard(
    title: "Wi-Fi",
    subtitle: "Home Network",
    icon: Image(systemName: "wifi"),
    iconColor: DSColor.System.blue,
    isOn: $wifiEnabled
)
```

### DSSlider

Slider with step support.

```swift
// Basic Slider
DSSlider(value: $brightness)

// With Title and Icon
DSSlider(
    "Volume",
    value: $volume,
    in: 0...100,
    step: 5,
    icon: Image(systemName: "speaker.wave.3.fill")
)

// Stepper
DSStepper(
    "Quantity",
    value: $quantity,
    in: 1...10,
    icon: Image(systemName: "cart.fill")
)
```

### DSList

List components with row accessories.

```swift
// Section
DSSection(header: { Text("GENERAL") }) {
    DSListRowSimple(
        "Wi-Fi",
        subtitle: "Home Network",
        icon: Image(systemName: "wifi"),
        iconColor: DSColor.System.blue
    )
    
    DSListRowSimple(
        "Bluetooth",
        subtitle: "On",
        icon: Image(systemName: "antenna.radiowaves.left.and.right"),
        iconColor: DSColor.System.blue
    )
}

// Row with Toggle
DSListRowSimple(
    "Airplane Mode",
    icon: Image(systemName: "airplane"),
    iconColor: DSColor.System.orange,
    accessory: .toggle(.constant(false))
)

// Row with Badge
DSListRowSimple(
    "Notifications",
    icon: Image(systemName: "bell.fill"),
    accessory: .badge(5)
)
```

### DSProgressView

Progress indicators.

```swift
// Linear Progress
DSProgressView(value: 65, label: "Upload Progress")

// Circular Progress
DSProgressView(value: 30, total: 100, style: .circular)

// Segmented Progress
DSProgressView(value: 60, total: 100, style: .segmented(5), label: "Steps")

// Download Progress Card
DSDownloadProgress(
    filename: "Document.pdf",
    progress: 45,
    fileSize: "12.5 MB"
)
```

### DSAlert

Alert dialogs with different types.

```swift
@State private var showAlert = false

// Info Alert
.dsAlert(
    type: .info,
    title: "Information",
    message: "This is an info alert.",
    isPresented: $showAlert
)

// Success Alert
.dsAlert(
    type: .success,
    title: "Success!",
    message: "Your changes have been saved.",
    isPresented: $showAlert
)

// Warning Alert
.dsAlert(
    type: .warning,
    title: "Warning",
    message: "Are you sure you want to continue?",
    primaryAction: "Yes",
    secondaryAction: "No",
    isPresented: $showAlert,
    onPrimary: { /* action */ }
)

// Error Alert
.dsAlert(
    type: .error,
    title: "Error",
    message: "Something went wrong.",
    isPresented: $showAlert
)
```

### DSSheet

Bottom sheets with drag-to-dismiss.

```swift
@State private var showSheet = false

// Basic Sheet
.dsSheet(title: "Options", isPresented: $showSheet) {
    VStack(spacing: DSSpacing.md) {
        Text("Sheet Content")
    }
    .padding()
}

// Confirmation Sheet
DSConfirmationSheet(
    title: "Delete Item",
    message: "This action cannot be undone.",
    confirmTitle: "Delete",
    cancelTitle: "Cancel",
    isDestructive: true,
    isPresented: $showSheet,
    onConfirm: { /* delete */ }
)
```

### DSLoadingIndicator

Loading states.

```swift
// Spinner
DSLoadingIndicator(style: .spinner)

// Dots
DSLoadingIndicator(style: .dots)

// Pulse
DSLoadingIndicator(style: .pulse)

// Progress
DSLoadingIndicator(style: .progress)

// Custom Color and Size
DSLoadingIndicator(
    style: .spinner,
    color: DSColor.System.orange,
    size: 32
)

// Loading Overlay
DSLoadingOverlay(isLoading: true, message: "Please wait...")
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

## Examples

The package includes three complete example screens:

### Login Screen
```swift
import AppleDesignSystem

// See Examples/DSLoginExample.swift
DSLoginExample()
```

### Settings Screen
```swift
// See Examples/DSSettingsExample.swift
DSSettingsExample()
```

### Dashboard Screen
```swift
// See Examples/DSDashboardExample.swift
DSDashboardExample()
```

---

## Architecture

```
AppleDesignSystem/
├── Sources/AppleDesignSystem/
│   ├── Tokens/                    # Design tokens
│   │   ├── DSTokens.swift         # Colors
│   │   ├── DSTypography.swift     # Fonts
│   │   ├── DSSpacing.swift        # Spacing & Radius
│   │   ├── DSAnimation.swift      # Animations
│   │   ├── DSShadow.swift         # Shadows
│   │   ├── DSMaterial.swift       # Glassmorphism
│   │   └── DSHaptics.swift        # Haptic feedback
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

## Customization

### Adding Custom Colors

```swift
extension DSColor {
    public enum Custom {
        public static let brand = Color(hex: "#FF5733")
        public static let accent = Color(hex: "#007AFF")
    }
}
```

### Adding Custom Components

```swift
public struct DSCustomComponent: View {
    public init() {}
    
    public var body: some View {
        // Your component using tokens
        HStack(spacing: DSSpacing.md) {
            // Content
        }
        .padding(DSSpacing.lg)
        .dsCard()
    }
}
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

## Support

- **Issues**: [GitHub Issues](https://github.com/anjggti-eng/AppleDesignSystem/issues)
- **Discussions**: [GitHub Discussions](https://github.com/anjggti-eng/AppleDesignSystem/discussions)

---

<div align="center">

**Made with passion for the Apple ecosystem**

[⬆ Back to Top](#appledesignsystem)

</div>
