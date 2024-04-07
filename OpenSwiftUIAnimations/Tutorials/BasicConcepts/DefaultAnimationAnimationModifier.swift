//
//  DefaultAnimationAnimationModifier.swift
//  OpenSwiftUIAnimations

import SwiftUI

struct DefaultAnimationAnimationModifier: View {
    
    let txt = Array("Hello")
    @State private var flipAngle = Double.zero
    
    var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 0) {
                ForEach(0..<txt.count, id: \.self) { flip in
                    Text(String(txt[flip]))
                        .font(.largeTitle)
                        .rotation3DEffect(.degrees(flipAngle), axis: (x: 0, y: 1, z: 0))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipAngle)
                }
                
            }
            
            Button {
                //
                flipAngle = (flipAngle == .zero) ? 360 : .zero
            } label: {
                Text("Flip")
            }
        }
    }
}

#Preview {
    DefaultAnimationAnimationModifier()
        .preferredColorScheme(.dark)
}
