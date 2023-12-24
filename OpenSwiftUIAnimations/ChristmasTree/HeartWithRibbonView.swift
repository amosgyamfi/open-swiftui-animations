//
//  GiftWithRibbonView.swift

import SwiftUI

// Define the properties that will drive the animations. Create a new struct to contain all the properties that will be independently animated.
struct HeartRibbonAnimation {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
    var chromaAngle = Angle.zero
}

struct HeartWithRibbonView: View {
    
    var body: some View {
        
        Text("💝")
        // Add the keyframe animator modifier
            .keyframeAnimator(
                // Provide an instance of the struct
                initialValue: ReactionAnimationProps()) { content, value in
                    content
                    // Apply modifiers on the view for each of the properties of the struct
                        .rotationEffect(value.angle)
                        .hueRotation(value.chromaAngle)
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(y: value.verticalTranslation)
                    
                } keyframes: { _ in
                    // Provide the keyframe track for the different properties you are animating. You should specify them with a key path.
                    KeyframeTrack(\.angle) {
                        CubicKeyframe(.zero, duration: 0.58)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.degrees(-16), duration: 0.125)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.zero, duration: 0.125)
                    }
                    
                    KeyframeTrack(\.verticalStretch) {
                        CubicKeyframe(1.0, duration: 0.1)
                        CubicKeyframe(0.6, duration: 0.15)
                        CubicKeyframe(1.5, duration: 0.1)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.88)
                        CubicKeyframe(0.8, duration: 0.1)
                        CubicKeyframe(1.04, duration: 0.4)
                        CubicKeyframe(1.0, duration: 0.22)
                    }
                    
                    KeyframeTrack(\.scale) {
                        // Specify the keyframe timing curve
                        LinearKeyframe(1.0, duration: 0.36)
                        SpringKeyframe(2.0, duration: 0.8, spring: .bouncy)
                        SpringKeyframe(1, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.verticalTranslation) {
                        LinearKeyframe(0.0, duration: 0.1)
                        SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                        SpringKeyframe(-120.0, duration: 1.0, spring: .bouncy)
                        SpringKeyframe(0.0, spring: .bouncy)
                    }
                    
                    KeyframeTrack(\.chromaAngle) {
                        LinearKeyframe(.zero, duration: 0.58)
                        LinearKeyframe(.degrees(45), duration: 0.125)
                        LinearKeyframe(.degrees(-30), duration: 0.125)
                        LinearKeyframe(.degrees(150), duration: 0.125)
                        LinearKeyframe(.zero, duration: 0.125)
                    }
                }
    }
}

#Preview {
    HeartWithRibbonView()
        .preferredColorScheme(.dark)
}
