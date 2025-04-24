//
//  AnimationContentView.swift
//  
//  Created by Amos Gyamfi on 23.4.2025.

/*
In this example, We prompt Gemini 2.5 Pro to watch an mp4 video of a recorded animation and generate a SwiftUI animation. Gemini 2.5 Pro isn't great at fixing SwiftUI errors, so we bring o3 to fix all errors using ChatGPT Chat Bar.  
*/

import SwiftUI

// Main view to display all animations
struct AnimationContentView: View {
    var body: some View {
        HStack(spacing: 40) { // Arrange animations horizontally
            MicrophoneAnimationView()
            HeartAnimationView()
            SparkleAnimationView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Center content
        .background(Color(white: 0.95)) // Light background similar to video
    }
}

// MARK: - 1. Microphone Pulse Animation

struct MicrophoneAnimationView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Pulsating Rings
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.blue.opacity(0.4)) // Standard Color usage
                    .frame(width: 80, height: 80)
                    .scaleEffect(isAnimating ? 1.8 : 1.0)
                    .opacity(isAnimating ? 0.0 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: false)
                            .delay(Double(index) * 0.3), // Standard animation
                        value: isAnimating
                    )
            }

            // Inner Blue Circle (Gradient)
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]), // Standard Gradient
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 80, height: 80)

            // Microphone Icon
            Image(systemName: "mic.fill")
                .font(.system(size: 35))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - 2. Heart Reaction Animation

struct HeartAnimationView: View {
    @State private var triggerAnimation = false
    let heartCount = 6
    let animationDuration = 1.8
    let staggerInterval = 0.1

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 80)

            ForEach(0..<heartCount, id: \.self) { index in
                HeartParticleView(
                    trigger: $triggerAnimation,
                    index: index,
                    duration: animationDuration,
                    stagger: staggerInterval
                )
            }

            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
                .frame(width: 80, height: 80)
                .zIndex(1)
        }
        .frame(width: 150, height: 150)
        .onAppear {
            triggerAnimation = true
        }
    }
}

// Represents a single floating heart particle
struct HeartParticleView: View {
    @Binding var trigger: Bool
    let index: Int
    let duration: Double
    let stagger: Double

    @State private var scale: CGFloat = 0.1
    @State private var yOffset: CGFloat = 0
    @State private var opacity: Double = 1.0
    @State private var isAnimating = false // Internal state to manage loops

    private let xTarget: CGFloat = CGFloat.random(in: -40...40)
    // Ensure yTarget is not zero to avoid division by zero issues, although abs() handles it mathematically
    private let yTarget: CGFloat = CGFloat.random(in: -120 ... -80)
    private let scaleTarget: CGFloat = CGFloat.random(in: 0.7...1.1)

    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 20))
            .foregroundColor(.red)
            .scaleEffect(scale)
             // Ensure calculations use CGFloat. abs() returns the same type (CGFloat).
            .offset(x: xTarget * (abs(yOffset) / abs(yTarget)), y: yOffset)
            .opacity(opacity)
            .onChange(of: trigger) { newValue in
                 // Use new 'trigger' parameter name to avoid conflict
                 // This logic starts the animation cycle when the parent trigger changes
                if newValue && !isAnimating {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * stagger) {
                        // Check trigger *again* before starting, in case it changed back quickly
                        if self.trigger {
                            startAnimationCycle()
                            isAnimating = true
                        }
                    }
                } else if !newValue {
                     // If trigger becomes false, stop animating
                    isAnimating = false
                    // Optionally reset to initial state immediately when stopped
                    // resetState() // You might want this depending on desired behavior
                }
            }
             // Add an .onAppear for initial setup if needed, though onChange handles the trigger
             // .onAppear {
             //    // Potentially initialize or check trigger state here too
             // }
    }

    func startAnimationCycle() {
        // Only proceed if the view should be animating
        guard isAnimating || trigger else {
            isAnimating = false // Ensure flag is correct if trigger is false
            return
        }

        resetState() // Reset to start values for the new cycle

        withAnimation(.easeOut(duration: duration)) {
            scale = scaleTarget
            yOffset = yTarget
            opacity = 0.0
        }

        // Schedule the *next* cycle check
        DispatchQueue.main.asyncAfter(deadline: .now() + duration ) { // Removed extra 0.05, delay until animation ends
            // Check if we should continue looping
            if self.trigger && self.isAnimating {
                startAnimationCycle() // Loop
            } else {
                // If trigger became false during animation, ensure we stop
                isAnimating = false
                resetState() // Reset state when stopping
            }
        }
    }

    func resetState() {
        scale = 0.1
        yOffset = 0
        opacity = 1.0
    }
}


// MARK: - 3. Sparkle Glow Animation

struct SparkleAnimationView: View {
    @State private var isAnimating = false

    // Rainbow radial gradient with semi‑transparent colors
    private let rainbowGradient = RadialGradient(
        gradient: Gradient(colors: [
            Color.red.opacity(0.7),
            Color.orange.opacity(0.7),
            Color.yellow.opacity(0.7),
            Color.green.opacity(0.7),
            Color.blue.opacity(0.7),
            Color.purple.opacity(0.7),
            Color.red.opacity(0.7)
        ]),
        center: .center,
        startRadius: 5,
        endRadius: 60
    )

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 80)

            Circle()
                .fill(rainbowGradient)
                .frame(width: 120, height: 120)
                .scaleEffect(isAnimating ? 1.6 : 0.1)
                .opacity(isAnimating ? 0.0 : 1.0)
                .animation(
                    Animation.easeInOut(duration: 2.0)
                        .repeatForever(autoreverses: false), // Standard animation
                    value: isAnimating
                )

            Image(systemName: "sparkles")
                .font(.system(size: 35))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    AnimationContentView()
}
