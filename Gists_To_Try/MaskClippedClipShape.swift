//
//  MaskClippedClipShape.swift
//
//
//  ListeningAnimation.swift
//  SwiftUIAnimation2026
//
//  Created by Amos Gyamfi on 28.12.2025.
//

import SwiftUI

struct MaskClippedClipShape: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 164, height: 164)
                            .foregroundStyle(.indigo.gradient)
                            .glassEffect()
                            .blendMode(.hardLight)
                            .overlay(
                                Image(systemName: "microphone.fill")
                                    .font(.largeTitle)
                                    .offset(y: -40)
                            )
                        
                        PhaseAnimator([false, true]) { move in
                            Circle()
                                .strokeBorder(
                                    style: StrokeStyle(
                                        lineWidth: 12,
                                        lineCap: .round,
                                        lineJoin: .round,
                                        dash: [60, 400],
                                        dashPhase: move ? 220 : -220)
                                )
                                .frame(width: 160, height: 160)
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.indigo, .white, .purple, .mint, .white, .orange, .indigo]), startPoint: .trailing, endPoint: .leading)
                                )
                        } animation: { move in
                                .linear.speed(0.1).repeatForever(autoreverses: false)
                        }
                        
                        Circle()
                            .frame(width: 164, height: 164)
                            .foregroundStyle(.indigo.gradient)
                        // 1. Mask
                            .mask(
                                ZStack {
                                    PhaseAnimator([false ,true]) { move in
                                        Image(.wave)
                                            .opacity(0.4)
                                            .scaleEffect(x: 2)
                                            .offset(x: move ? 20 : -20, y: move ? 36 : 25)
                                    } animation: { move in
                                            .easeIn(duration: 1.0).speed(0.25).repeatForever(autoreverses: true)
                                    }
                                    
                                    PhaseAnimator([true, false]) { move in
                                        Image(.wave)
                                            .opacity(0.6)
                                            .scaleEffect(x: 2)
                                            .offset(x: -20, y: move ? 30 : 36)
                                    } animation: { move in
                                            .easeOut(duration: 1.0)
                                    }
                                    
                                    PhaseAnimator([false, true]) { rotate in
                                        Image(.wave)
                                            .rotationEffect(.degrees(rotate ? 10 : -10))
                                            .scaleEffect(x: 2, y: 1)
                                            .offset(y: 40)
                                    } animation: { rotate in
                                            .easeInOut(duration: 1.0)
                                    }
                                }
                            )
                    }
                    Spacer()
                }
            } header: {
                Text("mask(alignment:_:)")
            } footer: {
                Text("Use mask(_:) to apply the opacity value of another view to the current view")
            }
            
            Section {
                // 2. ClipShape
                HStack {
                    Spacer()
                    ZStack {
                        PhaseAnimator([false ,true]) { move in
                            Image(.wave)
                                .opacity(0.4)
                                .scaleEffect(x: 2)
                                .offset(x: move ? 20 : -20, y: move ? 36 : 25)
                        } animation: { move in
                                .easeIn(duration: 1.0).speed(0.25).repeatForever(autoreverses: true)
                        }
                        
                        PhaseAnimator([true, false]) { move in
                            Image(.wave)
                                .opacity(0.6)
                                .scaleEffect(x: 2)
                                .offset(x: -20, y: move ? 30 : 36)
                        } animation: { move in
                                .easeOut(duration: 1.0)
                        }
                        
                        PhaseAnimator([false, true]) { rotate in
                            Image(.wave)
                                .rotationEffect(.degrees(rotate ? 10 : -10))
                                .scaleEffect(x: 2, y: 1)
                                .offset(y: 40)
                        } animation: { rotate in
                                .easeInOut(duration: 1.0)
                        }
                    }
                    //.glassEffect()
                    .clipShape(.circle)
                    
                    Spacer()
                }
            } header: {
                Text("clipShape(_:style:)")
            } footer: {
                Text("Use a shape to fill a view's frame while maintaining its aspect ratio")
            }
            
            Section {
                // 3. Clipped
                HStack {
                    Spacer()
                    ZStack {
                        PhaseAnimator([false ,true]) { move in
                            Image(.wave)
                                .opacity(0.4)
                                .scaleEffect(x: 2)
                                .offset(x: move ? 20 : -20, y: move ? 36 : 25)
                        } animation: { move in
                                .easeIn(duration: 1.0).speed(0.25).repeatForever(autoreverses: true)
                        }
                        
                        PhaseAnimator([true, false]) { move in
                            Image(.wave)
                                .opacity(0.6)
                                .scaleEffect(x: 2)
                                .offset(x: -20, y: move ? 30 : 36)
                        } animation: { move in
                                .easeOut(duration: 1.0)
                        }
                        
                        PhaseAnimator([false, true]) { rotate in
                            Image(.wave)
                                .rotationEffect(.degrees(rotate ? 10 : -10))
                                .scaleEffect(x: 2, y: 1)
                                .offset(y: 40)
                        } animation: { rotate in
                                .easeInOut(duration: 1.0)
                        }
                    }
                    
                    .clipped(antialiased: true)
                    
                    Spacer()
                }
                //.glassEffect()
            } header: {
                Text("clipped(antialiased:)")
            } footer: {
                Text("Clip a view to its rectangular bounding frame")
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    MaskClippedClipShape()
        .preferredColorScheme(.dark)
}
