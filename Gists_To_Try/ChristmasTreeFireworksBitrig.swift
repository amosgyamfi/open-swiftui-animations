import SwiftUI
import AVFoundation

@main
struct ChristmasTreeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var ornamentScale: [CGFloat] = Array(repeating: 1.0, count: 15)
    @State private var fireworks: [Firework] = []
    @State private var starRotation: Double = 0
    @State private var lightsOpacity: Double = 1.0
    @State private var audioEngine = AVAudioEngine()
    @State private var playerNode = AVAudioPlayerNode()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .blue.opacity(0.3), .purple.opacity(0.2)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                ZStack {
                    TreeView(
                        ornamentScale: $ornamentScale,
                        lightsOpacity: $lightsOpacity
                    )
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.yellow)
                        .shadow(color: .yellow, radius: 10)
                        .rotationEffect(.degrees(starRotation))
                        .offset(y: -280)
                }
                
                Spacer()
            }
            
            ForEach(fireworks) { firework in
                FireworkView(firework: firework)
            }
        }
        .onTapGesture { location in
            launchFireworkAt(x: location.x, y: location.y)
        }
        .onAppear {
            startAnimations()
        }
    }
    
    func startAnimations() {
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            starRotation = 360
        }
        
        withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
            lightsOpacity = 0.3
        }
        
        animateOrnaments()
        launchFireworks()
        setupAudio()
    }
    
    func setupAudio() {
        audioEngine.attach(playerNode)
        audioEngine.connect(playerNode, to: audioEngine.mainMixerNode, format: nil)
        try? audioEngine.start()
    }
    
    func playFireworkSound() {
        Task {
            guard let url = URL(string: "https://cdn.pixabay.com/audio/2022/03/24/audio_5f6c813d7c.mp3") else { return }
            
            do {
                let data = try Data(contentsOf: url)
                let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("firework.mp3")
                try data.write(to: tempURL)
                
                let audioFile = try AVAudioFile(forReading: tempURL)
                let buffer = AVAudioPCMBuffer(pcmFormat: audioFile.processingFormat, frameCapacity: AVAudioFrameCount(audioFile.length))!
                try audioFile.read(into: buffer)
                
                playerNode.stop()
                playerNode.scheduleBuffer(buffer, at: nil, options: [], completionHandler: nil)
                if !playerNode.isPlaying {
                    playerNode.play()
                }
            } catch {}
        }
    }
    
    func animateOrnaments() {
        for i in ornamentScale.indices {
            let delay = Double(i) * 0.1
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true).delay(delay)) {
                ornamentScale[i] = 1.3
            }
        }
    }
    
    func launchFireworks() {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            let newFirework = Firework(
                x: CGFloat.random(in: 50...350),
                y: CGFloat.random(in: 100...400),
                color: [.red, .blue, .green, .yellow, .purple, .pink, .orange].randomElement()!
            )
            fireworks.append(newFirework)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                fireworks.removeAll { $0.id == newFirework.id }
            }
        }
    }
    
    func launchFireworkAt(x: CGFloat, y: CGFloat) {
        let newFirework = Firework(
            x: x,
            y: y,
            color: [.red, .blue, .green, .yellow, .purple, .pink, .orange].randomElement()!
        )
        fireworks.append(newFirework)
        playFireworkSound()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            fireworks.removeAll { $0.id == newFirework.id }
        }
    }
}

struct TreeView: View {
    @Binding var ornamentScale: [CGFloat]
    @Binding var lightsOpacity: Double
    
    var body: some View {
        ZStack {
            VStack(spacing: -20) {
                Triangle()
                    .fill(LinearGradient(
                        colors: [.green, .green.opacity(0.7)],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 100, height: 80)
                
                Triangle()
                    .fill(LinearGradient(
                        colors: [.green.opacity(0.8), .green.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 140, height: 90)
                
                Triangle()
                    .fill(LinearGradient(
                        colors: [.green.opacity(0.7), .green.opacity(0.5)],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 180, height: 100)
                
                Rectangle()
                    .fill(.brown)
                    .frame(width: 40, height: 50)
            }
            
            OrnamentLayer(scale: ornamentScale, lightsOpacity: lightsOpacity)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct OrnamentLayer: View {
    let scale: [CGFloat]
    let lightsOpacity: Double
    
    let positions: [(CGFloat, CGFloat)] = [
        (0, -220), (-30, -200), (30, -200),
        (-20, -150), (20, -150), (0, -160),
        (-50, -100), (0, -110), (50, -100),
        (-70, -50), (-35, -60), (35, -60), (70, -50),
        (-80, 0), (-40, -10), (40, -10), (80, 0)
    ]
    
    var body: some View {
        ZStack {
            ForEach(0..<min(positions.count, scale.count), id: \.self) { i in
                Circle()
                    .fill([Color.red, .blue, .yellow, .pink, .purple, .orange][i % 6])
                    .frame(width: 15, height: 15)
                    .scaleEffect(scale[i])
                    .shadow(color: [Color.red, .blue, .yellow, .pink, .purple, .orange][i % 6], radius: 5)
                    .offset(x: positions[i].0, y: positions[i].1)
            }
            
            ForEach(0..<8, id: \.self) { i in
                Circle()
                    .fill(.white)
                    .frame(width: 8, height: 8)
                    .opacity(lightsOpacity)
                    .shadow(color: .white, radius: 3)
                    .offset(
                        x: CGFloat.random(in: -90...90),
                        y: CGFloat.random(in: -240...40)
                    )
            }
        }
    }
}

struct Firework: Identifiable {
    let id = UUID()
    let x: CGFloat
    let y: CGFloat
    let color: Color
}

struct FireworkView: View {
    let firework: Firework
    @State private var scale: CGFloat = 0.1
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { i in
                Circle()
                    .fill(firework.color)
                    .frame(width: 8, height: 8)
                    .offset(
                        x: cos(Double(i) * (.pi / 6)) * (50 * scale),
                        y: sin(Double(i) * (.pi / 6)) * (50 * scale)
                    )
            }
        }
        .opacity(opacity)
        .position(x: firework.x, y: firework.y)
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                scale = 1.5
                opacity = 0
            }
        }
    }
}
