<div align="center">

# AppleDesignSystem

### The Universal Design System for ALL Stacks

**Replicate Apple's stunning visual aesthetics on ANY platform, ANY framework**

![Swift](https://img.shields.io/badge/Swift-5.9+-F05138?style=for-the-badge&logo=swift)
![React](https://img.shields.io/badge/React-18+-61DAFB?style=for-the-badge&logo=react)
![Vue](https://img.shields.io/badge/Vue-3+-4FC08D?style=for-the-badge&logo=vue.js)
![Angular](https://img.shields.io/badge/Angular-17+-DD0031?style=for-the-badge&logo=angular)
![Svelte](https://img.shields.io/badge/Svelte-4+-FF3E00?style=for-the-badge&logo=svelte)
![HTML/CSS](https://img.shields.io/badge/HTML%2FCSS-Vanilla-E34F26?style=for-the-badge&logo=html5)
![License](https://img.shields.io/badge/License-MIT-34C759?style=for-the-badge)

---

**6 Stacks • 50+ Components • AI Agent Ready • Cross-Platform**

</div>

---

## Runs Everywhere

| Stack | Platform | Status |
|-------|----------|:------:|
| **SwiftUI** | iOS, macOS, watchOS, visionOS | ✅ |
| **React** | Web, Desktop (Electron) | ✅ |
| **Vue.js** | Web, Desktop | ✅ |
| **Angular** | Web, Desktop | ✅ |
| **Svelte** | Web, Desktop | ✅ |
| **HTML/CSS** | Any browser | ✅ |
| **Windows** | Via Swift for Windows | ✅ |
| **Linux** | Via Swift for Linux | ✅ |

---

## Table of Contents

- [Quick Start](#quick-start)
- [Stacks](#stacks)
- [Design Tokens](#design-tokens)
- [Components](#components)
- [AI Agent](#ai-agent)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

---

## Quick Start

### SwiftUI
```swift
import SwiftUI
import AppleDesignSystem

struct ContentView: View {
    var body: some View {
        DSButton("Continue", style: .filled) {}
    }
}
```

### React
```jsx
import { HapticButton, AppleWidget } from './AppleComponents';
import './AppleDesignSystem.css';

function App() {
  return (
    <AppleWidget>
      <HapticButton variant="primary">Continue</HapticButton>
    </AppleWidget>
  );
}
```

### Vue
```vue
<script>
import { HapticButton, AppleWidget } from './AppleDesignSystem';
</script>

<template>
  <AppleWidget>
    <HapticButton variant="primary">Continue</HapticButton>
  </AppleWidget>
</template>
```

### Angular
```typescript
import { HapticButtonComponent } from './haptic-button.component';

@Component({
  imports: [HapticButtonComponent],
  template: `<app-haptic-button variant="primary">Continue</app-haptic-button>`
})
```

### Svelte
```svelte
<script>
  import HapticButton from './HapticButton.svelte';
  import AppleWidget from './AppleWidget.svelte';
</script>

<AppleWidget>
  <HapticButton variant="primary">Continue</HapticButton>
</AppleWidget>
```

### HTML/CSS
```html
<link rel="stylesheet" href="AppleDesignSystem.css">
<link rel="stylesheet" href="AppleComponents.css">

<div class="apple-widget">
  <button class="apple-button apple-button--primary">Continue</button>
</div>
```

---

## Stacks

### SwiftUI (`Sources/`)
| Component | Description |
|-----------|-------------|
| DSButton | Button with 5 styles + haptics |
| DSCard | Card containers |
| DSTextField | Input fields with error states |
| DSBadge | Status badges |
| DSAvatar | User avatars |
| DSToggle | Toggle switch |
| DSSlider | Slider with steps |
| DSList | List components |
| DSProgressView | Progress indicators |
| DSAlert | Alert dialogs |
| DSSheet | Bottom sheets |
| DSLoadingIndicator | Loading states |
| DSDatePicker | Date picker |
| DSNavigation | Navigation bar |
| DSProfile | Profile components |
| DSChart | Bar, line, circular charts |
| DSTimer | Timer, clock, stopwatch |
| DSOnboarding | Onboarding screens |
| DSNotificationBanner | Notification banners |

### React (`React/`)
| Component | Description |
|-----------|-------------|
| HapticButton | Button with haptic feedback |
| AppleWidget | Card with glassmorphism |
| AppleInput | Input field |
| AppleSearch | Search bar |
| AppleBadge | Status badge |
| AppleAvatar | User avatar |
| AppleToggle | Toggle switch |
| AppleList | List container |
| AppleListItem | List item |
| AppleProgress | Progress bar |
| AppleCircularProgress | Circular progress |
| AppleLoading | Loading indicator |
| AppleAlert | Alert modal |
| AppleSheet | Bottom sheet |
| AppleBanner | Notification banner |
| AppleStat | Statistics card |
| AppleProfile | Profile header |
| AppleOnboarding | Onboarding screen |
| AppleTooltip | Tooltip |

### Vue (`Vue/`)
| Component | Description |
|-----------|-------------|
| HapticButton | Button with haptic feedback |
| AppleWidget | Card container |
| AppleInput | Input field |
| AppleList | List container |
| AppleListItem | List item |

### Angular (`Angular/`)
| Component | Description |
|-----------|-------------|
| HapticButtonComponent | Button with haptic feedback |
| WidgetComponent | Card container |
| InputComponent | Input field with CVA |

### Svelte (`Svelte/`)
| Component | Description |
|-----------|-------------|
| HapticButton | Button with haptic feedback |
| AppleWidget | Card container |
| AppleInput | Input field |
| AppleList | List container |
| AppleListItem | List item |

### HTML/CSS (`Vanilla/`)
| Class | Description |
|-------|-------------|
| apple-widget | Card container |
| apple-button | Button (primary/secondary/destructive/plain) |
| apple-input | Input field |
| apple-search | Search bar |
| apple-badge | Status badge |
| apple-avatar | User avatar |
| apple-toggle | Toggle switch |
| apple-list | List container |
| apple-progress | Progress bar |
| apple-progress-circular | Circular progress |
| apple-loading | Loading indicator |
| apple-shimmer | Shimmer effect |

---

## Design Tokens

### Colors (Semantic)
```
Action Background      #007AFF    Destructive      #FF3B30
Success                #34C759    Warning          #FF9500
Error                  #FF3B30    Info             #007AFF
Background Primary     #FFFFFF    Background Secondary  #F2F2F7
Label Primary          #000000    Label Secondary  rgba(60,60,67,0.6)
```

### Spacing
```
2px  4px  8px  12px  16px  20px  24px  32px
xxs   xs   sm   md    lg    xl   xxl  xxxl
```

### Radius
```
8px  12px  14px  16px  20px  9999px
sm    md    lg    xl   xxl    pill
```

### Shadows
```
sm  0 1px 2px rgba(0,0,0,0.05)
md  0 2px 8px rgba(0,0,0,0.1)
lg  0 4px 16px rgba(0,0,0,0.15)
xl  0 8px 32px rgba(0,0,0,0.2)
```

### Typography
```
34px bold    large-title
28px bold    title1
22px bold    title2
20px semi    title3
17px semi    headline
17px regular body
15px regular subheadline
13px regular footnote
12px regular caption1
11px regular caption2
```

---

## AI Agent

This Design System includes **System Prompts** to turn AI into a UI generator.

### How to use

1. Copy `SYSTEM_PROMPT_UNIVERSAL.md`
2. Paste as System Prompt in Cursor, Claude Projects, or Custom GPT
3. Ask: "Create a login screen"
4. The agent generates code using your Design System

### Available Prompts

| File | Stack |
|------|-------|
| `SYSTEM_PROMPT_UNIVERSAL.md` | ALL stacks |
| `SYSTEM_PROMPT_SWIFTUI.md` | SwiftUI only |
| `SYSTEM_PROMPT_REACT.md` | React only |

---

## Architecture

```
AppleDesignSystem/
├── Sources/                 # SwiftUI (iOS/macOS)
│   ├── Tokens/              # Colors, Typography, Spacing, Animations
│   ├── Modifiers/           # ViewModifiers
│   └── Components/          # 20+ SwiftUI components
├── React/                   # React/JSX
│   ├── AppleDesignSystem.css
│   ├── AppleComponents.css
│   ├── HapticButton.jsx
│   └── AppleComponents.jsx
├── Vue/                     # Vue.js
│   ├── HapticButton.vue
│   ├── AppleWidget.vue
│   └── ...
├── Angular/                 # Angular
│   ├── haptic-button.component.ts
│   ├── widget.component.ts
│   └── input.component.ts
├── Svelte/                  # Svelte
│   ├── HapticButton.svelte
│   ├── AppleWidget.svelte
│   └── ...
├── Vanilla/                 # HTML/CSS
│   └── index.html
├── Examples/                # SwiftUI examples
├── Demo/                    # SwiftUI demo app
├── Tests/                   # Unit tests
├── Resources/               # tokens.json
├── SYSTEM_PROMPT_*.md       # AI Agent prompts
├── Package.swift            # SPM manifest
├── LICENSE                  # MIT License
└── README.md                # This file
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

**Works on SwiftUI • React • Vue • Angular • Svelte • HTML/CSS**

**Works on Windows • Linux • macOS • iOS • watchOS • visionOS**

[⬆ Back to Top](#appledesignsystem)

</div>
