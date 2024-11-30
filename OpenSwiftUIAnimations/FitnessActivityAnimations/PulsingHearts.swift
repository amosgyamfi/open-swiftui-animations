import SwiftUI

struct PulsingHearts: View {
    let hearts: [(image: String, animation: Animation)] = [
        ("heartSpring", .easeOut(duration: 0.85)),
        ("heartSky", .easeInOut(duration: 0.85)),
        ("heartStrawberry", .easeIn(duration: 0.85))
    ]
    
    var body: some View {
        ZStack {
            ForEach(hearts, id: \.image) { heart in
                PulsingHeart(image: heart.image, animation: heart.animation)
            }
        }
    }
}

struct PulsingHeart: View {
    let image: String
    let animation: Animation
    
    var body: some View {
        PhaseAnimator([false, true]) { pulsate in
            Image(image)
                .scaleEffect(pulsate ? 2 : 0.1, anchor: .bottom)
                .offset(y: pulsate ? 10 : 0)
        } animation: { _ in
            animation
        }
    }
}

#Preview {
    PulsingHearts()
}
