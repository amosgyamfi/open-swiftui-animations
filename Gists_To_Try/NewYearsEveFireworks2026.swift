//
//  SwiftUIChristmas25Tree.swift
//
//  Created by Amos Gyamfi on 22.12.2025.

//  ContentView.swift
//  SwiftUIChristmasTree
//

import SwiftUI
import UIKit

// MARK: - Fireworks Background View
struct Fireworks25View: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let host = FireworksHostView()
        host.backgroundColor = .clear
        return host
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Layout is handled in FireworksHostView.layoutSubviews
    }
}

// Custom UIView that handles its own emitter layer
class FireworksHostView: UIView {
    
    private var particlesLayer: CAEmitterLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEmitter()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupEmitter()
    }
    
    private func setupEmitter() {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .cuboid
        emitterLayer.emitterMode = .outline
        emitterLayer.renderMode = .additive
        emitterLayer.seed = UInt32(Date().timeIntervalSince1970)
        
        // Create spark image programmatically
        let sparkImage = createSparkImage()
        
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
        cell1.color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        cell1.redRange = 0.9
        cell1.greenRange = 0.9
        cell1.blueRange = 0.9
        
        let subcell1_1 = CAEmitterCell()
        subcell1_1.contents = sparkImage
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
        subcell1_1.color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        
        let subcell1_2 = CAEmitterCell()
        subcell1_2.contents = sparkImage
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
        subcell1_2.color = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        
        cell1.emitterCells = [subcell1_1, subcell1_2]
        emitterLayer.emitterCells = [cell1]
        
        layer.addSublayer(emitterLayer)
        self.particlesLayer = emitterLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update emitter frame and position when layout changes
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        particlesLayer?.frame = bounds
        particlesLayer?.emitterPosition = CGPoint(x: bounds.width / 2, y: bounds.height - 50)
        particlesLayer?.emitterSize = CGSize(width: 0.0, height: 0.0)
        CATransaction.commit()
    }
    
    private func createSparkImage() -> CGImage? {
        let size: CGFloat = 64
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        
        let image = renderer.image { context in
            let center = CGPoint(x: size / 2, y: size / 2)
            let colors = [
                UIColor.white.cgColor,
                UIColor.white.withAlphaComponent(0.8).cgColor,
                UIColor.white.withAlphaComponent(0.0).cgColor
            ] as CFArray
            
            let locations: [CGFloat] = [0.0, 0.3, 1.0]
            
            if let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: locations) {
                context.cgContext.drawRadialGradient(
                    gradient,
                    startCenter: center,
                    startRadius: 0,
                    endCenter: center,
                    endRadius: size / 2,
                    options: .drawsAfterEndLocation
                )
            }
        }
        
        return image.cgImage
    }
}

struct SwiftUIChristmas25Tree: View {
    
    @State private var isSpinning = false
    let coral = Color(#colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1))
    let peach = Color(#colorLiteral(red: 1, green: 0.831372549, blue: 0.4745098039, alpha: 1))
    let lightLimeGreen = Color(#colorLiteral(red: 0.831372549, green: 0.9843137255, blue: 0.4745098039, alpha: 1))
    let springGreen = Color(#colorLiteral(red: 0.2862745098, green: 0.9803921569, blue: 0.4745098039, alpha: 1))
    let paleAqua = Color(#colorLiteral(red: 0.2862745098, green: 0.9882352941, blue: 0.8392156863, alpha: 1))
    let skyBlue = Color(#colorLiteral(red: 0.2901960784, green: 0.8392156863, blue: 1, alpha: 1))
    let softLavender = Color(#colorLiteral(red: 0.4784313725, green: 0.5058823529, blue: 1, alpha: 1))
    let electricPurple = Color(#colorLiteral(red: 0.8470588235, green: 0.5137254902, blue: 1, alpha: 1))
    let olive = Color(#colorLiteral(red: 0.5764705882, green: 0.3529411765, blue: 0, alpha: 1))
    let forestGreen = Color(#colorLiteral(red: 0, green: 0.5607843137, blue: 0, alpha: 1))
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Black background for fireworks visibility
                Color.black
                    .ignoresSafeArea()
                
                // Fireworks background
                Fireworks25View()
                    .ignoresSafeArea()
                
                VStack {
                    Image(.stream)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 128, height: 128)
                        .hueRotation(.degrees(isSpinning ? 0 : 150))
                        .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true).delay(0.5), value: isSpinning)
                
                ZStack {
                    ZStack {
                        Circle() // MARK: One. No delay
                            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [7, 7]))
                            .frame(width: 20, height: 20)
                            .foregroundStyle(coral.gradient)
                        
                        ForEach(0 ..< 4) {
                            //Circle()
                            Text("✨")
                                .font(.caption2)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -10)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 4, height: 4)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -160)
                    
                    ZStack {
                        Circle() // MARK: Two. 0.1 delay
                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [7, 7]))
                            .frame(width: 50, height: 50)
                            .foregroundStyle(peach.gradient)
                        
                        ForEach(0 ..< 4) {
                            //Circle()
                            Text("🌟")
                                .font(.caption2)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -25)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 6, height: 6)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.1), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -120)
                    
                    ZStack {
                        Circle() // Three. 0.2 delay
                            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [7, 7]))
                            .frame(width: 80, height: 80)
                            .foregroundStyle(lightLimeGreen.gradient)
                        
                        ForEach(0 ..< 4) {
                            //Circle()
                            Text("💫")
                                .font(.caption2)
                                .offset(y: -40)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.2), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -80)
                    
                    ZStack {
                        Circle() // MARK: Four. 0.3 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 110, height: 110)
                            .foregroundStyle(springGreen.gradient)
                        
                        ForEach(0 ..< 4) {
                            Circle()
                                .foregroundColor(.red)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -55)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.3), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -40)
                    
                    ZStack {
                        Circle() // MARK: Five. 0.4 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 140, height: 140)
                            .foregroundStyle(paleAqua.gradient)
                        
                        ForEach(0 ..< 4) {
                            Circle()
                                .foregroundStyle(.red.gradient)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -70)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 10, height: 10)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.4), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 0)
                    
                    ZStack {
                        Circle() // MARK: Six. 0.5 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 170, height: 170)
                            .foregroundStyle(skyBlue.gradient)
                        
                        ForEach(0 ..< 4) {
                            Circle()
                                .foregroundStyle(.red.gradient)
                                .offset(y: -85)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.5), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 40)
                    
                    ZStack {
                        Circle() // MARK: Seven. 0.6 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 200, height: 200)
                            .foregroundStyle(softLavender.gradient)
                        
                        ForEach(0 ..< 4) {
                            Image(systemName: "star")
                                .foregroundStyle(.red.gradient)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -100)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.6), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 80)
                    
                    ZStack {
                        Circle() // MARK: Eight. 0.7 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 230, height: 230)
                            .foregroundStyle(electricPurple.gradient)
                        
                        ForEach(0 ..< 4) {
                            Circle()
                                .foregroundStyle(.red.gradient)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -115)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 10, height: 10)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.7), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 120)
                    
                    ZStack {
                        Circle() // MARK: Nine. 0.8 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .frame(width: 260, height: 260)
                            .foregroundStyle(olive.gradient)
                        
                        ForEach(0 ..< 4) {
                            //Circle()
                            Text("🧧")
                                .font(.caption2)
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -130)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 12, height: 12)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.8), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 160)
                    
                    
                    ZStack {
                        Circle() // MARK: Ten. 0.9 delay
                            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [7, 7]))
                            .foregroundStyle(forestGreen.gradient)
                        
                        ForEach(0 ..< 4) {
                            Text("💐")
                                .font(.caption2)
                                .rotationEffect(.degrees(-45))
                                //.hueRotation(.degrees(isSpinning ? Double($0) * 310 : Double($0) * 50))
                                .offset(y: -145)
                                .rotationEffect(.degrees(Double($0) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.9), value: isSpinning)
                        }
                    }
                    .frame(width: 290, height: 290)
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 200)
                }
                .frame(width: 300, height: 500)
                .hueRotation(.degrees(isSpinning ? 0 : 150))
                .scaleEffect(1.5)
                .animation(.linear(duration: 2).repeatForever(autoreverses: true).delay(0.5), value: isSpinning)
                .onAppear() {
                    isSpinning.toggle()
                }
                }
            }
            .navigationTitle(Text("SwiftUI Christmas Tree"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    SwiftUIChristmas25Tree()
        .preferredColorScheme(.dark)
}
