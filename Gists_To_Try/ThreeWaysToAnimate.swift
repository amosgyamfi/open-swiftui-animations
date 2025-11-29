//
//  ThreeWaysToAnimate.swift
//  SwiftUIAnimation2026
//

import SwiftUI

struct ThreeWaysToAnimate: View {
    @State private var withAnimate = 0.0
    @State private var dotAnimate = 0.0
    @State private var bindAnimate = 0.0

    var body: some View {
        List {
            // 1. Animate all of the visual changes for a state change by changing the state inside a call to the withAnimation(_:_:) global function.
            VStack(alignment: .leading) {
                Text("1. withAnimation")
                    .font(.headline)
                Circle()
                    .fill(.blue)
                    .frame(width: 120, height: 120)
                    .offset(x: withAnimate)
                Button("withAnimate") {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        withAnimate = (withAnimate == 0.0 ? 260.0 : 0.0)
                    }
                }
                .padding()
                .glassEffect()
            }

            // 2. Add animation to a particular view when a specific value changes by applying the animation(_:value:) view modifier to the view.
            
            VStack(alignment: .leading) {
                Text("2. animation(_:value:)")
                    .font(.headline)
                Circle()
                    .fill(.green)
                    .frame(width: 120, height: 120)
                    .offset(x: dotAnimate)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: dotAnimate)
                Button(".animate") {
                    dotAnimate = (dotAnimate == 0.0 ? 260.0 : 0.0)
                }
                .padding()
                .glassEffect()
            }

            // 3. Animate changes to a Binding by using the binding’s animation(_:) method.

            VStack(alignment: .leading) {
                Text("3. binding.animation(_:)")
                    .font(.headline)

                Circle()
                    .fill(.orange)
                    .frame(width: 120, height: 120)
                    .offset(x: bindAnimate)

                Slider(
                    value: $bindAnimate.animation(.easeInOut(duration: 0.5)),
                    in: 0.0...260.0
                )
                .padding()
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ThreeWaysToAnimate()
        .preferredColorScheme(.dark)
}
