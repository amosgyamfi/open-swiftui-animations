//
//  Thinking2.swift
//  CoreSwiftUI
//
import SwiftUI

struct ThinkingWithAlex: View {
    @State private var currentPhraseIndex = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var thinking = true
    
    private static let phrases = [
        "Thinking           ",
        "Weighing Options   ",
        "Evaluating Sentence"
    ]
    
    var body: some View {
        HStack {
            //Spacer()
            animatedSparklesIcon
            //Spacer()
            //animatedPhrase
            //Spacer()
        }
        .padding(.horizontal, 90)
        .onReceive(timer) { _ in
            withAnimation {
                currentPhraseIndex = (currentPhraseIndex + 1) % Self.phrases.count
            }
        }
    }
    
    private var animatedSparklesIcon: some View {
        Image(systemName: "sparkles")
            .font(.system(size: 128, weight: .heavy))
            .foregroundStyle(EllipticalGradient(colors: [.blue, .indigo], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.5))
            .phaseAnimator([false , true]) { sparkleSymbol, animate in
                sparkleSymbol
                    .symbolEffect(.wiggle.byLayer, options: .repeat(3), value: animate)
                    .symbolEffect(.bounce.byLayer, options: .repeat(3), value: animate)
                    .symbolEffect(.pulse.byLayer, options: .repeat(3), value: animate)
                    .symbolEffect(.breathe.byLayer, options: .repeat(3), value: animate)
            }
    }
    
    private var animatedPhrase: some View {
        HStack(spacing: 0) {
            ForEach(Array(Self.phrases[currentPhraseIndex].enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .foregroundStyle(.blue)
                    .hueRotation(.degrees(thinking ? 220 : 0))
                    .opacity(thinking ? 1 : 0)
                    .scaleEffect(thinking ? 1 : 0.5, anchor: .bottom)
                    .animation(
                        .easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.05),
                        value: thinking
                    )
            }
        }
    }
}

#Preview {
    ThinkingWithAlex()
        .preferredColorScheme(.dark)
}
