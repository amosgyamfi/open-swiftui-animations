//
//  FlipCharactersXYZ.swift
//  OpenSwiftUIAnimations
import SwiftUI

struct FlipCharactersXYZ: View {
    
    let txt = Array("Hello")
    @State private var flipAngle = Double.zero
    
    @State private var flipX = Double.zero
    @State private var flipY = Double.zero
    @State private var flipZ = Double.zero
    @State private var flipXYZ = Double.zero
    
    var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 0) {
                ForEach(0..<txt.count, id: \.self) { flip in
                    Text(String(txt[flip]))
                        .font(.largeTitle)
                        .rotation3DEffect(.degrees(flipX), axis: (x: 1, y: 0, z: 0))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipX)
                        .rotation3DEffect(.degrees(flipY), axis: (x: 0, y: 1, z: 0))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipY)
                        .rotation3DEffect(.degrees(flipZ), axis: (x: 0, y: 0, z: 1))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipZ)
                        .rotation3DEffect(.degrees(flipXYZ), axis: (x: 1, y: 1, z: 1))
                        .animation(.default.delay(Double(flip) * 0.1), value: flipXYZ)
                }
                
            }
            .rotation3DEffect(
                .degrees(flipX),
                axis: (x: 1, y: 0, z: 0) // Only flip on the Y-axis
            )
            .rotation3DEffect(
                .degrees(flipY),
                axis: (x: 0, y: 1, z: 0) // Only flip on the Y-axis
            )
            .rotation3DEffect(
                .degrees(flipZ),
                axis: (x: 0, y: 0, z: 1) // Only flip on the Z-axis
            )
            .rotation3DEffect(
                .degrees(flipXYZ),
                axis: (x: 1, y: 1, z: 1) // Only flip on the Z-axis
            )
            
            HStack {
                Button {
                    withAnimation(.bouncy) {
                        flipX = (flipX == .zero) ? 360 : .zero
                    }
                } label: {
                    Text("FlipX")
                }
                
                Button {
                    withAnimation {
                        flipY = (flipY == .zero) ? 360 : .zero
                    }
                } label: {
                    Text("FlipY")
                }
                
                Button {
                    withAnimation(.bouncy) {
                        flipZ = (flipZ == .zero) ? 360 : .zero
                    }
                } label: {
                    Text("FlipZ")
                }
                
                Button {
                    withAnimation(.bouncy) {
                        flipXYZ = (flipXYZ == .zero) ? 360 : .zero
                    }
                } label: {
                    Text("FlipXYZ")
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    FlipCharactersXYZ()
        .preferredColorScheme(.dark)
}
