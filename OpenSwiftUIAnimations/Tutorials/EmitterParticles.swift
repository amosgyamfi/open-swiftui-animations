import SwiftUI

struct EmitterParticles: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                EmitterParticlesView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct EmitterParticlesView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 746.0, height: 1037.0)
        let host = UIView(frame: CGRect(x: 400.0, y: 400.0, width: size.width, height: size.height))

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 400.0, y: 400.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterShape = .point
        particlesLayer.emitterPosition = CGPoint(x: 373.0, y: 937.0)
        particlesLayer.emitterSize = CGSize(width: 0.0, height: 0.0)
        particlesLayer.emitterMode = .outline
        particlesLayer.renderMode = .additive

        let cell1 = CAEmitterCell()

        cell1.name = "Parent"
        cell1.birthRate = 5.0
        cell1.lifetime = 2.5
        cell1.velocity = 300.0
        cell1.velocityRange = 100.0
        cell1.yAcceleration = -100.0
        cell1.emissionLongitude = -90.0 * (.pi / 180.0)
        cell1.emissionRange = 45.0 * (.pi / 180.0)
        cell1.scale = 0.5
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        cell1.redRange = 0.9
        cell1.greenRange = 0.9
        cell1.blueRange = 0.9

        let image1_1 = UIImage(named: "Spark")?.cgImage

        let subcell1_1 = CAEmitterCell()
        subcell1_1.contents = image1_1
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
        subcell1_1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        let image1_2 = UIImage(named: "Spark")?.cgImage

        let subcell1_2 = CAEmitterCell()
        subcell1_2.contents = image1_2
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
        subcell1_2.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        cell1.emitterCells = [subcell1_1, subcell1_2]

        particlesLayer.emitterCells = [cell1]

        return host
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}

#Preview {
    EmitterParticles()
}
