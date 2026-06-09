// AppleDesignSystem
// A professional design system replicating Apple's ecosystem

// MARK: - Tokens
@_exported import struct SwiftUI.Color
@_exported import struct SwiftUI.Font
@_exported import struct SwiftUI.CGFloat
@_exported import struct SwiftUI.EdgeInsets
@_exported import struct SwiftUI.Image

// MARK: - Module Info

/*
 The AppleDesignSystem module provides:

 Tokens:
   - DSColor: Semantic colors (background, label, fill, system)
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
   - DSButton: iOS-style button with multiple variants
   - DSCard: Card containers
   - DSTextField: Input fields
   - DSBadge: Status badges
   - DSAvatar: User avatars
   - DSLoadingIndicator: Loading states
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
