// AppleDesignSystem
// A professional design system replicating Apple's ecosystem

// MARK: - Module Info

/*
 The AppleDesignSystem module provides:

 Tokens:
   - DSColor: Semantic colors (action, destructive, success, warning, error, background, label, fill, surface, border)
   - DSTypography: Font system (SF Pro, sizes, weights)
   - DSSpacing: Spacing and radius tokens
   - DSAnimation: Spring animations and timing
   - DSShadow: Shadow styles
   - DSMaterial: Glassmorphism materials
   - DSHaptics: Haptic feedback

 Modifiers:
   - DSCardModifier: Card styling
   - DSPressableModifier: Press interaction with haptics
   - DSTextModifier: Typography hierarchy
   - DSGlassModifier: Glassmorphism effect
   - DSShimmerModifier: Loading shimmer effect

 Components:
   - DSButton: iOS-style button with multiple variants and accessibility
   - DSCard: Card containers
   - DSTextField: Input fields with error states
   - DSBadge: Status badges
   - DSAvatar: User avatars with accessibility
   - DSToggle: Toggle with haptic feedback
   - DSSlider: Slider with step support
   - DSList: List components
   - DSProgressView: Progress indicators
   - DSAlert: Alert dialogs
   - DSSheet: Bottom sheets
   - DSLoadingIndicator: Loading states
   - DSDatePicker: Date picker
   - DSNavigation: Navigation bar
   - DSProfile: Profile components
   - DSChart: Charts (bar, line, circular)
   - DSTimer: Timer, clock, stopwatch
   - DSOnboarding: Onboarding screens
   - DSTooltip: Tooltips
   - DSNotificationBanner: Notification banners
*/

// Usage example:
/*
 import AppleDesignSystem

 struct ContentView: View {
     var body: some View {
         VStack {
             DSButton("Continue", style: .filled) {
                 // action
             }

             DSCard {
                 Text("Hello World")
                     .dsTextStyle(.headline)
             }
         }
     }
 }
*/
