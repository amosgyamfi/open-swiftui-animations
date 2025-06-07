//
//  WWDC25Animation.swift
//
//  Created by Amos Gyamfi on 7.6.2025.
//

import SwiftUI

struct W: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.14378*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.08155*width, y: 0))
        path.addLine(to: CGPoint(x: 0.18455*width, y: 0.77679*height))
        path.addLine(to: CGPoint(x: 0.30258*width, y: 0))
        path.addLine(to: CGPoint(x: 0.37983*width, y: 0))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.77679*height))
        path.addLine(to: CGPoint(x: 0.61803*width, y: 0))
        path.addLine(to: CGPoint(x: 0.69313*width, y: 0))
        path.addLine(to: CGPoint(x: 0.8133*width, y: 0.77679*height))
        path.addLine(to: CGPoint(x: 0.91631*width, y: 0))
        path.addLine(to: CGPoint(x: 0.99785*width, y: 0))
        path.addLine(to: CGPoint(x: 0.85193*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0.77468*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0.65451*width, y: 0.23661*height))
        path.addLine(to: CGPoint(x: 0.53219*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0.46137*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0.33906*width, y: 0.23661*height))
        path.addLine(to: CGPoint(x: 0.21888*width, y: 0.99554*height))
        path.addLine(to: CGPoint(x: 0.14378*width, y: 0.99554*height))
        path.closeSubpath()
        return path
    }
}

struct D: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.51887*width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.45536*height), control1: CGPoint(x: 0.78459*width, y: 0), control2: CGPoint(x: width, y: 0.20387*height))
        path.addLine(to: CGPoint(x: width, y: 0.54464*height))
        path.addCurve(to: CGPoint(x: 0.51887*width, y: height), control1: CGPoint(x: width, y: 0.79613*height), control2: CGPoint(x: 0.78459*width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.51887*width, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.13208*width, y: 0.13393*height))
        path.addLine(to: CGPoint(x: 0.13208*width, y: 0.86607*height))
        path.addLine(to: CGPoint(x: 0.48113*width, y: 0.86607*height))
        path.addCurve(to: CGPoint(x: 0.86792*width, y: 0.5*height), control1: CGPoint(x: 0.69475*width, y: 0.86607*height), control2: CGPoint(x: 0.86792*width, y: 0.70218*height))
        path.addCurve(to: CGPoint(x: 0.48113*width, y: 0.13393*height), control1: CGPoint(x: 0.86792*width, y: 0.29782*height), control2: CGPoint(x: 0.69475*width, y: 0.13393*height))
        path.addLine(to: CGPoint(x: 0.13208*width, y: 0.13393*height))
        path.closeSubpath()
        return path
    }
}

struct C: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.50847*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.99366*width, y: 0.35*height), control1: CGPoint(x: 0.73615*width, y: 0), control2: CGPoint(x: 0.92886*width, y: 0.14715*height))
        path.addLine(to: CGPoint(x: 0.81626*width, y: 0.35*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.15*height), control1: CGPoint(x: 0.76151*width, y: 0.23201*height), control2: CGPoint(x: 0.6405*width, y: 0.15*height))
        path.addCurve(to: CGPoint(x: 0.15254*width, y: 0.49167*height), control1: CGPoint(x: 0.3081*width, y: 0.15*height), control2: CGPoint(x: 0.15254*width, y: 0.30297*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.83333*height), control1: CGPoint(x: 0.15254*width, y: 0.68036*height), control2: CGPoint(x: 0.3081*width, y: 0.83333*height))
        path.addCurve(to: CGPoint(x: 0.80795*width, y: 0.65*height), control1: CGPoint(x: 0.63378*width, y: 0.83333*height), control2: CGPoint(x: 0.74989*width, y: 0.75897*height))
        path.addLine(to: CGPoint(x: 0.99366*width, y: 0.65*height))
        path.addCurve(to: CGPoint(x: 0.50847*width, y: height), control1: CGPoint(x: 0.92886*width, y: 0.85285*height), control2: CGPoint(x: 0.73615*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.5*height), control1: CGPoint(x: 0.22765*width, y: height), control2: CGPoint(x: 0, y: 0.77614*height))
        path.addCurve(to: CGPoint(x: 0.50847*width, y: 0), control1: CGPoint(x: 0, y: 0.22386*height), control2: CGPoint(x: 0.22765*width, y: 0))
        path.closeSubpath()
        return path
    }
}

struct Two: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.17961*width, y: 0.34349*height))
        path.addLine(to: CGPoint(x: 0.00971*width, y: 0.34349*height))
        path.addCurve(to: CGPoint(x: 0.1068*width, y: 0.14348*height), control1: CGPoint(x: -0.00162*width, y: 0.3116*height), control2: CGPoint(x: 0.00194*width, y: 0.22696*height))
        path.addCurve(to: CGPoint(x: 0.48059*width, y: 0.00435*height), control1: CGPoint(x: 0.23787*width, y: 0.03913*height), control2: CGPoint(x: 0.38633*width, y: 0.00435*height))
        path.addCurve(to: CGPoint(x: 0.91748*width, y: 0.14348*height), control1: CGPoint(x: 0.57767*width, y: 0.00435*height), control2: CGPoint(x: 0.82363*width, y: 0.01739*height))
        path.addCurve(to: CGPoint(x: 0.95631*width, y: 0.39565*height), control1: CGPoint(x: 1.00485*width, y: 0.26087*height), control2: CGPoint(x: 0.99515*width, y: 0.31304*height))
        path.addCurve(to: CGPoint(x: 0.63593*width, y: 0.67391*height), control1: CGPoint(x: 0.91605*width, y: 0.4813*height), control2: CGPoint(x: 0.70874*width, y: 0.63043*height))
        path.addCurve(to: CGPoint(x: 0.35437*width, y: 0.86087*height), control1: CGPoint(x: 0.56311*width, y: 0.71739*height), control2: CGPoint(x: 0.33495*width, y: 0.84783*height))
        path.addCurve(to: CGPoint(x: 0.99515*width, y: 0.86087*height), control1: CGPoint(x: 0.36991*width, y: 0.8713*height), control2: CGPoint(x: 0.78803*width, y: 0.86522*height))
        path.addLine(to: CGPoint(x: 0.99515*width, y: height))
        path.addLine(to: CGPoint(x: 0.00971*width, y: height))
        path.addLine(to: CGPoint(x: 0.00971*width, y: 0.89565*height))
        path.addCurve(to: CGPoint(x: 0.69418*width, y: 0.45652*height), control1: CGPoint(x: 0.22978*width, y: 0.75362*height), control2: CGPoint(x: 0.67476*width, y: 0.46696*height))
        path.addCurve(to: CGPoint(x: 0.7233*width, y: 0.20436*height), control1: CGPoint(x: 0.71845*width, y: 0.44348*height), control2: CGPoint(x: 0.87379*width, y: 0.29132*height))
        path.addCurve(to: CGPoint(x: 0.29612*width, y: 0.18697*height), control1: CGPoint(x: 0.57282*width, y: 0.1174*height), control2: CGPoint(x: 0.39321*width, y: 0.13045*height))
        path.addCurve(to: CGPoint(x: 0.17961*width, y: 0.34349*height), control1: CGPoint(x: 0.21845*width, y: 0.23219*height), control2: CGPoint(x: 0.18609*width, y: 0.31016*height))
        path.closeSubpath()
        return path
    }
}

struct Five: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.18224*width, y: 0.69658*height))
        path.addLine(to: CGPoint(x: 0.00934*width, y: 0.69658*height))
        path.addCurve(to: CGPoint(x: 0.00934*width, y: 0.73932*height), control1: CGPoint(x: 0.00467*width, y: 0.69658*height), control2: CGPoint(x: 0.00467*width, y: 0.7094*height))
        path.addCurve(to: CGPoint(x: 0.10748*width, y: 0.88462*height), control1: CGPoint(x: 0.01624*width, y: 0.78349*height), control2: CGPoint(x: 0.07944*width, y: 0.85897*height))
        path.addCurve(to: CGPoint(x: 0.48598*width, y: 0.99145*height), control1: CGPoint(x: 0.13551*width, y: 0.91026*height), control2: CGPoint(x: 0.28972*width, y: 0.99573*height))
        path.addCurve(to: CGPoint(x: 0.8785*width, y: 0.88462*height), control1: CGPoint(x: 0.68224*width, y: 0.98718*height), control2: CGPoint(x: 0.77671*width, y: 0.97771*height))
        path.addCurve(to: CGPoint(x: 0.99065*width, y: 0.60256*height), control1: CGPoint(x: 0.99065*width, y: 0.78205*height), control2: CGPoint(x: 0.99911*width, y: 0.6748*height))
        path.addCurve(to: CGPoint(x: 0.83645*width, y: 0.40171*height), control1: CGPoint(x: 0.97664*width, y: 0.48291*height), control2: CGPoint(x: 0.90187*width, y: 0.4359*height))
        path.addCurve(to: CGPoint(x: 0.49533*width, y: 0.33333*height), control1: CGPoint(x: 0.76168*width, y: 0.36264*height), control2: CGPoint(x: 0.66355*width, y: 0.33333*height))
        path.addCurve(to: CGPoint(x: 0.20093*width, y: 0.42308*height), control1: CGPoint(x: 0.36075*width, y: 0.33333*height), control2: CGPoint(x: 0.24299*width, y: 0.39316*height))
        path.addLine(to: CGPoint(x: 0.23364*width, y: 0.14103*height))
        path.addLine(to: CGPoint(x: 0.93458*width, y: 0.14103*height))
        path.addLine(to: CGPoint(x: 0.93458*width, y: 0.00427*height))
        path.addLine(to: CGPoint(x: 0.08878*width, y: 0.00427*height))
        path.addLine(to: CGPoint(x: 0.02336*width, y: 0.56837*height))
        path.addLine(to: CGPoint(x: 0.18224*width, y: 0.56837*height))
        path.addCurve(to: CGPoint(x: 0.63084*width, y: 0.47435*height), control1: CGPoint(x: 0.24299*width, y: 0.52136*height), control2: CGPoint(x: 0.38318*width, y: 0.43589*height))
        path.addCurve(to: CGPoint(x: 0.79906*width, y: 0.69658*height), control1: CGPoint(x: 0.8785*width, y: 0.51281*height), control2: CGPoint(x: 0.81776*width, y: 0.67521*height))
        path.addCurve(to: CGPoint(x: 0.48598*width, y: 0.84187*height), control1: CGPoint(x: 0.78037*width, y: 0.71794*height), control2: CGPoint(x: 0.72897*width, y: 0.82478*height))
        path.addCurve(to: CGPoint(x: 0.18224*width, y: 0.69658*height), control1: CGPoint(x: 0.29159*width, y: 0.85555*height), control2: CGPoint(x: 0.20249*width, y: 0.75071*height))
        path.closeSubpath()
        return path
    }
}

struct WWDC25Animation: View {
    var body: some View {
        VStack(spacing: 16) {
            W()
                .phaseAnimator([0.6, 1.2, 1.0, 1.0]) { w, jiggle in
                    W()
                        .foregroundStyle(
                            AngularGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.13, green: 0.69, blue: 0.57),
                                    Color(red: 0.96, green: 0.84, blue: 0.22),
                                    Color(red: 0.99, green: 0.57, blue: 0.18),
                                    Color(red: 0.96, green: 0.29, blue: 0.32),
                                    Color(red: 0.67, green: 0.25, blue: 0.96),
                                    Color(red: 0.26, green: 0.59, blue: 1.00),
                                    Color(red: 0.13, green: 0.69, blue: 0.57)
                                ]),
                                center: .center
                            )
                        )
                        .scaleEffect(x: jiggle)
                } animation: { jiggle in
                        .bouncy(duration: 1, extraBounce: 0.4)
                }
            
            HStack(spacing: 16) {
                D()
                    .phaseAnimator([0.6, 1.2, 1.0, 1.0]) { d, jiggle in
                        D()
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 1.00, green: 0.35, blue: 0.35),
                                        Color(red: 0.99, green: 0.43, blue: 0.71),
                                        Color(red: 0.75, green: 0.40, blue: 0.97),
                                        Color(red: 0.25, green: 0.60, blue: 1.00)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .scaleEffect(x: jiggle, anchor: .trailing)
                    } animation: { jiggle in
                            .bouncy(duration: 1, extraBounce: 0.4)
                    }
                
                C()
                    .phaseAnimator([0.6, 1.2, 1.0, 1.0]) { c, jiggle in
                        C()
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.75, green: 0.40, blue: 0.97),
                                        Color(red: 0.25, green: 0.60, blue: 1.00)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .scaleEffect(x: jiggle, anchor: .leading)
                    } animation: { jiggle in
                            .bouncy(duration: 1, extraBounce: 0.4)
                    }
            }
            
            HStack(spacing: 16) {
                Two()
                    .phaseAnimator([0.6, 1.2, 1.0, 1.0]) { two, jiggle in
                        Two()
                            .foregroundStyle(.white.opacity(0.95))
                            .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 10)
                            .overlay(
                                Two()
                                    .stroke(.white.opacity(0.8), lineWidth: 1)
                                    .blur(radius: 0.5)
                                    .offset(y: 1)
                                    .mask(
                                        Two()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.white.opacity(0.8), .clear]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                    )
                            )
                            .scaleEffect(x: jiggle, anchor: .trailing)
                    } animation: { jiggle in
                            .bouncy(duration: 1, extraBounce: 0.4)
                    }
                
                Five()
                    .phaseAnimator([0.6, 1.2, 1.0, 1.0]) { five, jiggle in
                        Five()
                            .foregroundStyle(.white.opacity(0.95))
                            .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 10)
                            .overlay(
                                Five()
                                    .stroke(.white.opacity(0.8), lineWidth: 1)
                                    .blur(radius: 0.5)
                                    .offset(y: 1)
                                    .mask(
                                        Five()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.clear]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                    )
                            )
                            .scaleEffect(x: jiggle, anchor: .leading)
                    } animation: { jiggle in
                            .bouncy(duration: 1, extraBounce: 0.4)
                    }
            }
        }
        .padding()
        .scaleEffect(0.6)
    }
}

#Preview {
    WWDC25Animation()
}
