# AppleDesignSystem

[![Swift 5.9+](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![iOS 17+](https://img.shields.io/badge/iOS-17+-blue.svg)](https://developer.apple.com/ios/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

A professional design system replicating Apple's ecosystem aesthetics, built entirely in SwiftUI.

## Features

- **Design Tokens** - Semantic colors, typography, spacing, and animation parameters
- **Glassmorphism** - Native iOS blur materials and frosted glass effects
- **Haptic Feedback** - System-level tactile responses for all interactions
- **Spring Animations** - Apple-standard elastic transitions
- **Component Library** - Production-ready UI components
- **Dynamic Type** - Full accessibility support
- **Dark Mode** - Automatic light/dark theme switching

## Requirements

| Dependency | Version |
|------------|---------|
| iOS | 17.0+ |
| macOS | 14.0+ |
| visionOS | 1.0+ |
| Swift | 5.9+ |
| Xcode | 15.0+ |

## Installation

### Swift Package Manager

1. In Xcode, go to **File → Add Package Dependencies**
2. Enter the repository URL:
```
https://github.com/yourusername/AppleDesignSystem.git
```
3. Select your desired version rule and click **Add Package**

### Manual

Clone the repository and add the `AppleDesignSystem` folder to your project.

## Usage

### Quick Start

```swift
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        VStack(spacing: DSSpacing.lg) {
            DSButton("Continue", style: .filled) {
                // Action
            }
            
            DSCard {
                Text("Hello World")
                    .dsTextStyle(.headline)
            }
        }
    }
}
```

### Design Tokens

```swift
// Colors
DSColor.System.blue
DSColor.Label.primary
DSColor.Background.secondary

// Typography
Text("Title").dsTextStyle(.largeTitle)
Text("Body").dsTextStyle(.body)

// Spacing
.padding(DSSpacing.lg)

// Radius
.clipShape(RoundedRectangle(cornerRadius: DSRadius.lg))

// Shadows
.dsShadow(DSShadow.md)

// Animations
.animation(DSAnimation.Spring.default, value: true)
```

### Components

#### Button

```swift
DSButton("Tap Me", style: .filled) { }
DSButton("Bordered", style: .bordered) { }
DSButton("Glass", style: .glass) { }
DSButton("Loading...", isLoading: true) { }
```

#### Card

```swift
DSCard {
    Text("Card Content")
}

DSCardWithHeader(header: { Text("Header") }) {
    Text("Body Content")
}
```

#### TextField

```swift
DSTextField("Placeholder", text: $text, title: "Label")
DSSearchBar("Search...", text: $searchText)
```

#### Badge

```swift
DSBadge("New")
DSBadge("Active", color: .green)
DSCountBadge(count: 5)
```

#### Avatar

```swift
DSAvatar(name: "John Appleseed", size: .md)
DSAvatarGroup(names: ["John", "Jane", "Bob"])
```

#### Loading

```swift
DSLoadingIndicator(style: .spinner)
DSLoadingIndicator(style: .dots)
DSLoadingIndicator(style: .pulse)
```

### Modifiers

```swift
// Card style
.dsCard()

// Pressable with haptics
.dsPressable()

// Glassmorphism
.dsGlass()

// Shimmer loading
.dsShimmer()
```

## Architecture

```
AppleDesignSystem/
├── Tokens/          # Design tokens (colors, typography, spacing)
├── Modifiers/       # ViewModifiers for styling
├── Components/      # Reusable UI components
└── Extensions/      # Swift extensions
```

## Customization

### Updating Tokens

Modify the token files in `Sources/AppleDesignSystem/Tokens/`:

```swift
// DSTokens.swift
public enum DSColor {
    public enum System {
        public static let custom = Color(hex: "#FF5733")
    }
}
```

### Adding Components

Create new components in `Sources/AppleDesignSystem/Components/`:

```swift
public struct DSCustomComponent: View {
    public init() {}
    
    public var body: some View {
        // Your component
    }
}
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Apple Human Interface Guidelines
- SwiftUI Documentation
- SF Symbols
