import SwiftUI

struct FlipXYZ: View {
    @State private var flipX = Double.zero
    @State private var flipY = Double.zero
    @State private var flipZ = Double.zero
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Hello")
                .font(.largeTitle)
                .rotation3DEffect(
                    .degrees(flipX),
                    axis: (x: 1, y: 0, z: 0) // Only flip on the X-axis
                )
                .rotation3DEffect(
                    .degrees(flipY),
                    axis: (x: 0, y: 1, z: 0) // Only flip on the Y-axis
                )
                .rotation3DEffect(
                    .degrees(flipZ),
                    axis: (x: 0, y: 0, z: 1) // Only flip on the Z-axis
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
                    withAnimation(.bouncy) {
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
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    FlipXYZ()
        .preferredColorScheme(.dark)
}
