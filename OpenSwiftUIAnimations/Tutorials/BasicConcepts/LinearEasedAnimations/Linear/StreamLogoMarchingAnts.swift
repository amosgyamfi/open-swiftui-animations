//
//  StreamLogoMarchingAnts.swift
/*
 - ANIMATION EASING: LINEAR:
     - Does not conform to natural laws of motion
     - Constant speed and mechanical rather than natural
     - Has acceleration of 0 (no speedup or slowdown)
     - Ignore completely? No.
     - Application areas:
         - Timelapse
         - Ken Burns Effect for photos
         - Opacity: Object that fades
         - Color changes
         - Camera effects: zooming and panning
         - Rotation: Yahoo Weather
         - Animating path properties: dashes and line pattern: Stream logo (marching ants), Measuring Heartrate (watchOS)
 */
//  MARCHING ANTS: An example of where using the Linear interpolation makes sense
//

import SwiftUI

struct StreamLogoMarchingAnts: View {
    
    @State private var marching = false
    let streamBlue = Color(#colorLiteral(red: 0, green: 0.3725490196, blue: 1, alpha: 1))
    let streamRed = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 84.609299, y: 20.5695))
            path.addLine(to: CGPoint(x: 125.579002, y: 17.6653))
            path.addCurve(to: CGPoint(x: 128.404007, y: 22.7234), control1: CGPoint(x: 128.283005, y: 17.4736), control2: CGPoint(x: 129.985992, y: 20.5212))
            path.addLine(to: CGPoint(x: 99.744698, y: 62.643501))
            path.addCurve(to: CGPoint(x: 97.145401, y: 63.9772), control1: CGPoint(x: 99.143799, y: 63.480598), control2: CGPoint(x: 98.176102, y: 63.9772))
            path.addLine(to: CGPoint(x: 32.875999, y: 63.9772))
            path.addCurve(to: CGPoint(x: 30.2789, y: 62.646702), control1: CGPoint(x: 31.846901, y: 63.9772), control2: CGPoint(x: 30.880501, y: 63.482201))
            path.addLine(to: CGPoint(x: 1.54301, y: 22.726601))
            path.addCurve(to: CGPoint(x: 4.36729, y: 17.6653), control1: CGPoint(x: -0.041925, y: 20.5247), control2: CGPoint(x: 1.66077, y: 17.4729))
            path.addLine(to: CGPoint(x: 45.2118, y: 20.569799))
            path.addLine(to: CGPoint(x: 62.657001, y: 1.06645))
            path.addCurve(to: CGPoint(x: 67.4431, y: 1.08469), control1: CGPoint(x: 63.935398, y: -0.362652), control2: CGPoint(x: 66.175301, y: -0.354332))
            path.addLine(to: CGPoint(x: 84.609299, y: 20.5695))
            path.closeSubpath()
            path.move(to: CGPoint(x: 93.189796, y: 57.6478))
            path.addLine(to: CGPoint(x: 66.600998, y: 47.710999))
            path.addLine(to: CGPoint(x: 66.600998, y: 57.6478))
            path.addLine(to: CGPoint(x: 93.189796, y: 57.6478))
            path.closeSubpath()
            path.move(to: CGPoint(x: 63.400101, y: 57.6478))
            path.addLine(to: CGPoint(x: 63.400101, y: 47.710999))
            path.addLine(to: CGPoint(x: 36.811298, y: 57.6478))
            path.addLine(to: CGPoint(x: 63.400101, y: 57.6478))
            path.closeSubpath()
            path.move(to: CGPoint(x: 60.3321, y: 45.337101))
            path.addLine(to: CGPoint(x: 33.1661, y: 55.477699))
            path.addLine(to: CGPoint(x: 13.1805, y: 27.697001))
            path.addLine(to: CGPoint(x: 60.3321, y: 45.337101))
            path.closeSubpath()
            path.move(to: CGPoint(x: 69.613297, y: 45.337101))
            path.addLine(to: CGPoint(x: 96.779297, y: 55.477699))
            path.addLine(to: CGPoint(x: 116.764999, y: 27.697001))
            path.addLine(to: CGPoint(x: 69.613297, y: 45.337101))
            path.closeSubpath()
            path.move(to: CGPoint(x: 63.4249, y: 43.018501))
            path.addLine(to: CGPoint(x: 63.4249, y: 9.5828))
            path.addLine(to: CGPoint(x: 41.212799, y: 34.657001))
            path.addLine(to: CGPoint(x: 63.4249, y: 43.018501))
            path.closeSubpath()
            path.move(to: CGPoint(x: 66.600998, y: 43.0191))
            path.addLine(to: CGPoint(x: 66.600998, y: 9.58759))
            path.addLine(to: CGPoint(x: 88.813499, y: 34.6576))
            path.addLine(to: CGPoint(x: 66.600998, y: 43.0191))
            path.closeSubpath()
            path.move(to: CGPoint(x: 34.699501, y: 32.345699))
            path.addLine(to: CGPoint(x: 39.8102, y: 26.6031))
            path.addLine(to: CGPoint(x: 14.8419, y: 24.8137))
            path.addLine(to: CGPoint(x: 34.699501, y: 32.345699))
            path.closeSubpath()
            path.move(to: CGPoint(x: 95.057899, y: 32.345699))
            path.addLine(to: CGPoint(x: 89.947601, y: 26.6031))
            path.addLine(to: CGPoint(x: 114.916, y: 24.8137))
            path.addLine(to: CGPoint(x: 95.057899, y: 32.345699))
            path.closeSubpath()
            path.move(to: CGPoint(x: 95.057899, y: 32.345699))
        }
        .stroke(
            style: StrokeStyle(
                lineWidth: 2,
                lineCap: .round,
                lineJoin: .round,
                miterLimit: 10,
                dash: [7, 5],
                // dash: [300, 15]
                dashPhase: marching ? 100 : -100
            )
        )
        .foregroundStyle(
                .linearGradient(
                    colors: [streamBlue, streamRed],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        .offset(x: 120, y: 340)
        .onAppear{
            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)) {
                marching.toggle()
            }
        }
    }
}

#Preview {
    StreamLogoMarchingAnts()
}
