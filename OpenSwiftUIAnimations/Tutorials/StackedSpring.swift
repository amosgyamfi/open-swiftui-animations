//
//  StackedSpring.swift
//  OpenSwiftUIAnimations
//
//  Created by Amos Gyamfi on 27.1.2024.
//

import SwiftUI

struct StackedSpring: View {
    let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]
    @State private var isMoving = false
    
    var body: some View {
        ZStack {
            ForEach(0..<colors.count, id: \.self) {
                Rectangle()
                    .fill(colors[$0])
                    .frame(width: 100, height: 100)
                    .cornerRadius(isMoving ? CGFloat($0) * 25.0 : CGFloat($0) * 1.0)
                    .offset(x: isMoving ? CGFloat($0) * 25.0 : CGFloat($0) * -25.0,
                            y: CGFloat($0) * 10.0)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    isMoving.toggle()
                }
            }
            
        }
    }
}

#Preview {
    StackedSpring()
        .preferredColorScheme(.dark)
}
