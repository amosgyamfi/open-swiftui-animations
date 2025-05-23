//
//  Claude4iOSFireworks.swift
//
//  Created by Amos Gyamfi on 23.5.2025.
//

import SwiftUI
import UIKit

// MARK: - Fireworks Emitter View
struct FireworksEmitterView: UIViewRepresentable {
    @Binding var triggerFireworks: Bool
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if triggerFireworks {
            createFireworksEffect(in: uiView)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                triggerFireworks = false
            }
        }
    }
    
    private func createFireworksEffect(in view: UIView) {
        // Random launch position
        let launchX = CGFloat.random(in: view.bounds.width * 0.2...view.bounds.width * 0.8)
        let launchY = view.bounds.height
        let explosionY = CGFloat.random(in: view.bounds.height * 0.2...view.bounds.height * 0.6)
        
        // Create launch trail
        createLaunchTrail(in: view, startX: launchX, startY: launchY, endY: explosionY)
        
        // Delay explosion to match launch timing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.createExplosion(in: view, x: launchX, y: explosionY)
        }
    }
    
    private func createLaunchTrail(in view: UIView, startX: CGFloat, startY: CGFloat, endY: CGFloat) {
        let emitterLayer = CAEmitterLayer()
        
        // Position at launch point
        emitterLayer.emitterPosition = CGPoint(x: startX, y: startY)
        emitterLayer.emitterShape = .point
        emitterLayer.emitterMode = .outline
        
        // Create launch particle
        let launchCell = CAEmitterCell()
        launchCell.name = "launch"
        launchCell.birthRate = 5
        launchCell.lifetime = 0.8
        launchCell.velocity = 300
        launchCell.velocityRange = 50
        launchCell.emissionLongitude = -.pi / 2  // Upward
        launchCell.emissionRange = .pi / 8
        
        // Appearance
        launchCell.scale = 0.3
        launchCell.scaleRange = 0.1
        launchCell.color = UIColor.white.cgColor
        launchCell.redRange = 0.3
        launchCell.greenRange = 0.3
        launchCell.blueRange = 0.3
        launchCell.alphaSpeed = -1.0
        
        // Physics
        launchCell.yAcceleration = 100  // Gravity effect
        launchCell.scaleSpeed = -0.2
        
        // Particle image (create a simple circle)
        launchCell.contents = createParticleImage(size: 8, color: .white).cgImage
        
        emitterLayer.emitterCells = [launchCell]
        view.layer.addSublayer(emitterLayer)
        
        // Animate the emitter position to simulate rocket trail
        let animation = CABasicAnimation(keyPath: "emitterPosition")
        animation.fromValue = CGPoint(x: startX, y: startY)
        animation.toValue = CGPoint(x: startX, y: endY)
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        emitterLayer.add(animation, forKey: "position")
        
        // Remove after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            emitterLayer.removeFromSuperlayer()
        }
    }
    
    private func createExplosion(in view: UIView, x: CGFloat, y: CGFloat) {
        let emitterLayer = CAEmitterLayer()
        
        // Position at explosion point
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        emitterLayer.emitterShape = .point
        emitterLayer.emitterMode = .outline
        
        // Create multiple types of explosion particles
        var cells: [CAEmitterCell] = []
        
        // Main explosion particles
        let explosionCell = CAEmitterCell()
        explosionCell.name = "explosion"
        explosionCell.birthRate = 200
        explosionCell.lifetime = 3.0
        explosionCell.lifetimeRange = 1.0
        explosionCell.velocity = 200
        explosionCell.velocityRange = 100
        explosionCell.emissionLongitude = 0
        explosionCell.emissionRange = 2 * .pi  // Full circle
        
        // Random colors for fireworks
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .magenta, .cyan]
        let selectedColor = colors.randomElement() ?? .red
        
        explosionCell.color = selectedColor.cgColor
        explosionCell.redRange = 0.4
        explosionCell.greenRange = 0.4
        explosionCell.blueRange = 0.4
        explosionCell.alphaSpeed = -0.8
        
        // Physics
        explosionCell.yAcceleration = 200  // Gravity
        explosionCell.scale = 0.5
        explosionCell.scaleRange = 0.3
        explosionCell.scaleSpeed = -0.2
        
        explosionCell.contents = createParticleImage(size: 6, color: selectedColor).cgImage
        cells.append(explosionCell)
        
        // Sparkle particles
        let sparkleCell = CAEmitterCell()
        sparkleCell.name = "sparkle"
        sparkleCell.birthRate = 100
        sparkleCell.lifetime = 2.0
        sparkleCell.lifetimeRange = 0.5
        sparkleCell.velocity = 150
        sparkleCell.velocityRange = 80
        sparkleCell.emissionLongitude = 0
        sparkleCell.emissionRange = 2 * .pi
        
        sparkleCell.color = UIColor.white.cgColor
        sparkleCell.alphaSpeed = -1.0
        sparkleCell.yAcceleration = 150
        sparkleCell.scale = 0.2
        sparkleCell.scaleRange = 0.1
        sparkleCell.scaleSpeed = -0.1
        
        // Create sparkle image
        sparkleCell.contents = createSparkleImage().cgImage
        cells.append(sparkleCell)
        
        // Trailing particles
        let trailCell = CAEmitterCell()
        trailCell.name = "trail"
        trailCell.birthRate = 50
        trailCell.lifetime = 1.5
        trailCell.velocity = 100
        trailCell.velocityRange = 30
        trailCell.emissionLongitude = 0
        trailCell.emissionRange = 2 * .pi
        
        trailCell.color = selectedColor.cgColor
        trailCell.alphaSpeed = -2.0
        trailCell.yAcceleration = 100
        trailCell.scale = 0.3
        trailCell.scaleSpeed = -0.3
        
        trailCell.contents = createParticleImage(size: 4, color: selectedColor).cgImage
        cells.append(trailCell)
        
        emitterLayer.emitterCells = cells
        view.layer.addSublayer(emitterLayer)
        
        // Stop emission after initial burst
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            emitterLayer.birthRate = 0
        }
        
        // Remove layer after particles fade
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            emitterLayer.removeFromSuperlayer()
        }
    }
    
    private func createParticleImage(size: CGFloat, color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        return renderer.image { context in
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.fillEllipse(in: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        }
    }
    
    private func createSparkleImage() -> UIImage {
        let size: CGFloat = 8
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        return renderer.image { context in
            let cgContext = context.cgContext
            cgContext.setStrokeColor(UIColor.white.cgColor)
            cgContext.setLineWidth(1)
            
            // Draw star shape
            cgContext.move(to: CGPoint(x: size/2, y: 0))
            cgContext.addLine(to: CGPoint(x: size/2, y: size))
            cgContext.move(to: CGPoint(x: 0, y: size/2))
            cgContext.addLine(to: CGPoint(x: size, y: size/2))
            cgContext.move(to: CGPoint(x: size*0.2, y: size*0.2))
            cgContext.addLine(to: CGPoint(x: size*0.8, y: size*0.8))
            cgContext.move(to: CGPoint(x: size*0.8, y: size*0.2))
            cgContext.addLine(to: CGPoint(x: size*0.2, y: size*0.8))
            
            cgContext.strokePath()
        }
    }
}

// MARK: - Main SwiftUI View
struct Claude4iOSFireworks: View {
    @State private var triggerFireworks = false
    @State private var showInstructions = true
    
    var body: some View {
        ZStack {
            // Night sky background
            LinearGradient(
                colors: [
                    Color.black,
                    Color.blue.opacity(0.3),
                    Color.purple.opacity(0.2)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Stars background
            StarsView()
            
            // Fireworks layer
            FireworksEmitterView(triggerFireworks: $triggerFireworks)
                .ignoresSafeArea()
            
            // Instructions overlay
            if showInstructions {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Text("🎆 Fireworks Display 🎆")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Tap anywhere to launch fireworks!")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button("Hide Instructions") {
                            withAnimation(.easeOut(duration: 0.5)) {
                                showInstructions = false
                            }
                        }
                        .foregroundColor(.yellow)
                        .padding(.top)
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.ultraThinMaterial)
                            .opacity(0.8)
                    )
                    .padding(.horizontal, 32)
                    .padding(.bottom, 50)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .onTapGesture {
            triggerFireworks = true
            
            // Hide instructions after first tap
            if showInstructions {
                withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                    showInstructions = false
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Stars Background View
struct StarsView: View {
    @State private var animateStars = false
    
    var body: some View {
        ZStack {
            ForEach(0..<100, id: \.self) { _ in
                Circle()
                    .fill(Color.white.opacity(Double.random(in: 0.3...1.0)))
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 0.7)
                    )
                    .scaleEffect(animateStars ? 1.2 : 0.8)
                    .animation(
                        .easeInOut(duration: Double.random(in: 2...4))
                        .repeatForever(autoreverses: true)
                        .delay(Double.random(in: 0...2)),
                        value: animateStars
                    )
            }
        }
        .onAppear {
            animateStars = true
        }
    }
}

#Preview {
    Claude4iOSFireworks()
}
