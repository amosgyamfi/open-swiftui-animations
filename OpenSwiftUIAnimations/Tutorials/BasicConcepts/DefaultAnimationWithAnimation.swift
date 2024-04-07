//
//  DefaultAnimationWithAnimation.swift
//  OpenSwiftUIAnimations
//
//  Created by Amos Gyamfi on 16.3.2024.
//

import SwiftUI

struct DefaultAnimationWithAnimation: View {
    @State private var flipAngle = Double.zero
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Hello")
                .font(.largeTitle)
                .rotation3DEffect (
                    .degrees(flipAngle),
                    axis: (x: 0, y: 0, z: 1)
                )
            
            Button {
                //
                withAnimation {
                    flipAngle = (flipAngle == .zero) ? 360 : .zero
                }
            } label: {
                Text("Flip")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    DefaultAnimationWithAnimation()
        .preferredColorScheme(.dark)
}
