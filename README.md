## Open SwiftUI Animations
### Pure SwiftUI animation inspirations for your next iOS, macOS, visionOS, and watchOS projects. Enjoy 😊. 

### Animate Anything With SwiftUI
![SwiftUI animations preview](GIF_Previews/jiggleAndJelloGithub.gif)

SwiftUI animation is compelling and superb. You can add incredible effects and beautiful animations to your apps with minimal effort. **Why use an animation library instead of creating these tiny effects yourself?** Get inspiration from [here](OpenSwiftUIAnimations) and start building your SwiftUI animations today. Most animations here are based on the animations section in the [Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/animations). Check out the [Xcode project](OpenSwiftUIAnimations) for examples of the new [Phase Animator](https://developer.apple.com/documentation/swiftui/phaseanimator), Symbol Effects, [Keyframe Animator](https://developer.apple.com/documentation/swiftui/keyframeanimator), and [Spring Animations](https://developer.apple.com/documentation/swiftui/spring) for iOS 17 and beyond. Do you want to see an animation that is not here, or did you find an engaging one to add? Contact me on X: [@amos_gyamfi](https://twitter.com/amos_gyamfi) or add it as a task in the [project's backlog](https://github.com/users/amosgyamfi/projects/1/views/1).

### SwiftUI Fireworks Animation: Before running the code, ensure you have a small image like "Spark.png" in your assets catalog. 
![SwiftUI fireworks animation](GIF_Previews/Gemini2-5SwiftUIFireworks.gif)

```swift
import SwiftUI
import UIKit // Still needed for CAEmitterLayer, UIView, UIColor, UIImage

// MARK: - UIViewRepresentable Wrapper
struct ParticleEmitterView: UIViewRepresentable {

    // This matches the original fixed size, but SwiftUI might resize it.
    // We'll use relative positioning instead of hardcoding based on this size.
    // let originalSize = CGSize(width: 625.0, height: 1118.0)

    // You can add @Binding properties here if you want to control
    // emitter parameters dynamically from SwiftUI state.

    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 625.0, height: 1118.0)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true
        
        particlesLayer.backgroundColor = UIColor.black.cgColor
        particlesLayer.emitterShape = .point
        particlesLayer.emitterPosition = CGPoint(x: 312.5, y: 1018.0)
        particlesLayer.emitterSize = CGSize(width: 0.0, height: 0.0)
        particlesLayer.emitterMode = .outline
        particlesLayer.renderMode = .additive
        
        // Parent cell
        let cell1 = CAEmitterCell()
        cell1.name = "Parent"
        cell1.birthRate = 5.0
        cell1.lifetime = 2.5
        cell1.velocity = 300.0
        cell1.velocityRange = 100.0
        cell1.yAcceleration = -100.0
        cell1.emissionLongitude = -90.0 * (.pi / 180.0)
        cell1.emissionRange = 45.0 * (.pi / 180.0)
        cell1.scale = 0.0
        cell1.color = UIColor.white.cgColor
        cell1.redRange = 0.9
        cell1.greenRange = 0.9
        cell1.blueRange = 0.9
        
        // Trail subcell
        let subcell1_1 = CAEmitterCell()
        subcell1_1.contents = UIImage(named: "Spark")?.cgImage
        subcell1_1.name = "Trail"
        subcell1_1.birthRate = 45.0
        subcell1_1.lifetime = 0.5
        subcell1_1.beginTime = 0.01
        subcell1_1.duration = 1.7
        subcell1_1.velocity = 80.0
        subcell1_1.velocityRange = 100.0
        subcell1_1.xAcceleration = 100.0
        subcell1_1.yAcceleration = 350.0
        subcell1_1.emissionLongitude = -360.0 * (.pi / 180.0)
        subcell1_1.emissionRange = 22.5 * (.pi / 180.0)
        subcell1_1.scale = 0.5
        subcell1_1.scaleSpeed = 0.13
        subcell1_1.alphaSpeed = -0.7
        subcell1_1.color = UIColor.white.cgColor
        
        // Firework subcell
        let subcell1_2 = CAEmitterCell()
        subcell1_2.contents = UIImage(named: "Spark")?.cgImage
        subcell1_2.name = "Firework"
        subcell1_2.birthRate = 20000.0
        subcell1_2.lifetime = 15.0
        subcell1_2.beginTime = 1.6
        subcell1_2.duration = 0.1
        subcell1_2.velocity = 190.0
        subcell1_2.yAcceleration = 80.0
        subcell1_2.emissionRange = 360.0 * (.pi / 180.0)
        subcell1_2.spin = 114.6 * (.pi / 180.0)
        subcell1_2.scale = 0.1
        subcell1_2.scaleSpeed = 0.09
        subcell1_2.alphaSpeed = -0.7
        subcell1_2.color = UIColor.white.cgColor
        
        // Set up emitter cells hierarchy
        cell1.emitterCells = [subcell1_1, subcell1_2]
        particlesLayer.emitterCells = [cell1]
        
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct Gemini25FireworksView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ParticleEmitterView()
        }
    }
}

#Preview {
    Gemini25FireworksView()
}
```
---

### Thinking, Weighing Options, Evaluating Sentence 
![](GIF_Previews/thinkingWeighingEvaluating.gif)
---

### SwiftUI Moving Border With dashPhase 
![Hue rotation](GIF_Previews/SwiftUIMovingBorder.gif)
---

### Getting Inner and Outer Borders 
![Inner and Outer Borders](GIF_Previews/innerOuterBorder.gif)
---

### [PulsingHearts.swift](https://github.com/amosgyamfi/open-swiftui-animations/blob/master/OpenSwiftUIAnimations/FitnessActivityAnimations/PulsingHearts.swift)  
![Pulsating Hearts](GIF_Previews/pulsatingHeart.gif)
---

### [SlideToUnlock.swift](https://github.com/amosgyamfi/open-swiftui-animations/blob/master/OpenSwiftUIAnimations/SlideToCancelAnimations/SlideToCancelWithScale.swift): Find [All Variations](https://github.com/amosgyamfi/open-swiftui-animations/tree/master/OpenSwiftUIAnimations/SlideToCancelAnimations) 
![Slide to unlock](GIF_Previews/slideToUnlock.gif)
---


### [CrossFadeNumericTransition.swift](https://github.com/amosgyamfi/open-swiftui-animations/blob/master/OpenSwiftUIAnimations/HumanInitiatedAnimations/IncreaseDecrease.swift) 
![Numeric transition](GIF_Previews/numericTransitionCrossfade.gif)
---

### Hue Rotation effect with Phase Animator 
![Hue rotation](GIF_Previews/wwdc24Invite.gif)
---

### Hello WWDC24 
![WWDC24](GIF_Previews/wwdc24.gif)
---

### Duolingo getting started and loading animations
![Duolingo Animations](GIF_Previews/duoAnimated.gif)
---

### How Things Move: Constant speed, acceleration, deceleration
![How Things Move](GIF_Previews/linearEasedAnimations.gif)
---

### Vision Pro 3D rotation 
![Vision Pro 3D rotation](GIF_Previews/3dObjectsInvisionOS.gif)
---

### 3D Rotate String Characters 
![3D Rotate String Characters ](GIF_Previews/characterFlip.gif)
---

### Flip String Characters in XYZ
![Flip String Characters in XYZ](GIF_Previews/flipCharactersXYZ.gif)
---

### Use DashPhase to move dashes around a shape. 
![Animate dashphase](GIF_Previews/dashPhase.gif)
---

### Animated Signature: Use trimming to draw and erase the path. 
![Animated Signature](GIF_Previews/SignatureAnimation.gif)
---

**Reactions with Springs**: [EmotionalReactions.swift](OpenSwiftUIAnimations/Reactions/MessengerReactions/EmotionalReactions.swift)
![EmotionalReactions.swift](GIF_Previews/emotionalReactions.gif)
---

**SwiftUI 2024 Christmas Tree**: [SwiftUI Christmas Tree](OpenSwiftUIAnimations/ChristmasTree)
![SwiftUI Christmas Tree](GIF_Previews/SwiftUIChristmasTree.gif)
---

**Expressive Reactions**: [IncomingMessageView.swift](OpenSwiftUIAnimations/Reactions/MessengerReactions/IncomingMessageView.swift)
![Expressive Reactions](GIF_Previews/ExpressiveReactions.gif)
---

**Content Transition: Smooth Symbols Swapping**: [Add soon]()
![Content Transition:](GIF_Previews/contentTransition.gif)
---

**Content Transition, Phase Animator with Springs: Create seamless icon replacement: [Add soon]()
![Content Transition, Phase Animator](GIF_Previews/contentTransitionWithPhaseAnimator.gif)
---

**X Like Animation**: [XLike Animation](OpenSwiftUIAnimations/Reactions/XLike)
![XLike](GIF_Previews/Xlike.gif)
---

**Animating Achors**: [Add soon]()
![AnchorMovement.swift](GIF_Previews/anchorMovement.gif)
---

**Achieving Bounce**: [Add soon]()
![BouncyAlternative.swift](GIF_Previews/bouncyAlternative.gif)
---

**3D Y-Rotation - visionOS**: [Add soon]()
![AirPodsMaxAnimation.swift](GIF_Previews/AirPodsMaxAnimation.gif)
---

**Incoming call animation, symbol effect with variable color and hue rotation**: [IncomingCall.swift](https://gist.github.com/amosgyamfi/26ba8cbecac18202c6f2065836297766#file-incomingcall-swift)
![AirPodsMaxAnimation.swift](GIF_Previews/incomingCallAnimation.gif)
---




