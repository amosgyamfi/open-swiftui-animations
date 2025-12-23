//
//  FlowerAnimation.swift
//  Demonstrating 2D rotation around specified anchor
//
//  Created by Amos Gyamfi on 15.12.2025.
//

import SwiftUI

struct FlowerAnimation: View {
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Spacer()
                
                PhaseAnimator([false, true]) { animateWhole in
                    ZStack {
                        PhaseAnimator([false, true]) { animateRM in
                            Image(.rBack)
                                .rotationEffect(.degrees(animateRM ? -30 : 0), anchor: .bottomLeading)
                                .offset(x: 20, y: -84)
                        } animation: { animateRM in
                                .easeIn(duration: 2).delay(1)
                        }
                        
                        
                        PhaseAnimator([false, true]) { animateLB in
                            Image(.lBack)
                                .rotationEffect(.degrees(animateLB ? 30 : 0), anchor: .bottomTrailing)
                                .offset(x: -20, y: -84)
                        } animation: { animateLB in
                                .easeIn(duration: 2).delay(1)
                        }
                        
                        
                        PhaseAnimator([false, true]) { animateRM in
                            Image(.rMiddle)
                                .rotationEffect(.degrees(animateRM ? -30 : 0), anchor: .bottomLeading)
                                .offset(x: 50, y: -44)
                        } animation: { animateRM in
                                .easeInOut(duration: 2).delay(1)
                        }
                        
                        PhaseAnimator([false, true]) { animateLM in
                            Image(.lMiddle)
                                .rotationEffect(.degrees(animateLM ? 30 : 0), anchor: .bottomTrailing)
                                .offset(x: -50, y: -44)
                        } animation: { animateLM in
                                .easeInOut(duration: 2).delay(1)
                        }
                        
                        // Front
                        PhaseAnimator([false, true]) { animateRF in
                            Image(.rFront)
                                .rotationEffect(.degrees(animateRF ? -30 : 0), anchor: .bottomLeading)
                                .offset(x: 70)
                        } animation: { animateRF in
                                .easeOut(duration: 2).delay(1)
                        }
                        
                        PhaseAnimator([false, true]) { animateLF in
                            Image(.lFront)
                                .rotationEffect(.degrees(animateLF ? 30 : 0), anchor: .bottomTrailing)
                                .offset(x: -70)
                        } animation: { animateLF in
                                .easeOut(duration: 2).delay(1)
                        }
                    }
                    .scaleEffect(animateWhole ? 0.7 : 1.0)
                    .blendMode(.hardLight)
                } animation: { animateWhole in
                        .easeInOut(duration: 2).delay(1)
                }
            }
        }
    }
}

#Preview {
    FlowerAnimation()
        .preferredColorScheme(.dark)
}
