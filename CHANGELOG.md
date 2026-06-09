# Changelog

All notable changes to AppleDesignSystem will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-06-09

### Added

#### Tokens
- DSColor - Semantic color system (background, label, fill, system colors)
- DSTypography - Font system with SF Pro family support
- DSSpacing - Spacing and radius tokens (HIG compliant)
- DSAnimation - Spring animations with Apple-standard parameters
- DSShadow - Shadow styles (sm, md, lg, xl)
- DSMaterial - Glassmorphism materials (ultraThin, thin, regular, thick)
- DSHaptics - Haptic feedback system (impact, notification, selection)

#### Modifiers
- DSCardModifier - Card styling with elevation and glassmorphism
- DSPressableModifier - Press interaction with haptic feedback
- DSTextModifier - Typography hierarchy system
- DSGlassModifier - Glassmorphism effects
- DSShimmerModifier - Loading shimmer effect

#### Components
- DSButton - iOS-style button with multiple variants (filled, bordered, plain, glass, destructive)
- DSCard - Card containers (elevated, grouped, inset, plain)
- DSTextField - Input fields with validation states
- DSBadge - Status badges (filled, outlined, dot)
- DSAvatar - User avatars with initials fallback
- DSLoadingIndicator - Loading states (spinner, dots, pulse, progress)

#### Examples
- DSLoginExample - Login screen implementation
- DSSettingsExample - Settings screen implementation
- DSDashboardExample - Dashboard screen implementation

### Features
- Full Dark Mode support
- Dynamic Type accessibility
- Haptic feedback on all interactions
- Spring animations following Apple HIG
- Glassmorphism materials
- Production-ready code quality
- Swift Package Manager support
- iOS 17+, macOS 14+, visionOS 1.0+ compatibility

## [Unreleased]

### Planned
- Additional component variants
- More animation presets
- Widget support
- watchOS support
- Documentation improvements
- Unit tests
- UI tests
