//
//  Thinking.swift

import SwiftUI

struct Thinking: View {
    @State private var counter: Int = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var thinking: Bool = false
    //let letters = Array("Thinking")
    //let letters = Array("Weighing Options")
    let letters = Array("Evaluating Sentence")
    
    let slideGently = Animation.easeOut(duration: 0.5).delay(2).repeatForever(autoreverses: false).delay(-0.67)
    
    var body: some View {
        HStack {
            Image(systemName: "sparkles")
                .font(.title)
                .foregroundStyle(EllipticalGradient(colors:[.blue, .indigo], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.5))
                .phaseAnimator([false , true]) { ai, thinking in
                    ai
                        .symbolEffect(.breathe.byLayer, value: thinking)
                }
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { think in
                    Text(String(letters[think]))
                        .foregroundStyle(.blue)
                        .hueRotation(.degrees(thinking ? 220 : 0))
                        .opacity(thinking ? 0 : 1)
                        .scaleEffect(x: thinking ? 0.75 : 1, y: thinking ? 1.25 : 1, anchor: .bottom)
                    //.offset(y: thinking ? -2 : 0)
                        .animation(.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: false).delay(Double(think) / 20), value: thinking)
                    //.animation(.timingCurve(0.68, -0.6, 0.32, 1.6).delay(2).repeatForever(autoreverses: false).delay(Double(think) / 20), value: thinking)
                }
                
            }
            
        }
        .onAppear {
            thinking = true
        }
    }
}

#Preview {
    Thinking()
        .preferredColorScheme(.dark)
}
