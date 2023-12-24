//
//  MickeyMouseAnimation.swift
//  OpenSwiftUIAnimations

import SwiftUI

struct MickeyMouseAnimation: View {
    var body: some View {
        ZStack {
            VStack(spacing: -14) {
                Image(.upperBody)
                    .phaseAnimator([false, true]) { mickeyUpperBody, isMovingDownUp in
                        
                        mickeyUpperBody
                            .offset(y: isMovingDownUp ? -0.5 : 1)
                    } animation: { isMovingDownUp in
                            .easeInOut
                    }
                
                Image(.skirt)
                    .zIndex(4)
                    .phaseAnimator([false, true]) { mickeySkirt, isMovingDownUp in
                        mickeySkirt
                            .offset(y: isMovingDownUp ? 0 : -2)
                    }
                    .offset(x: -8)
                
                Image(.feet)
                    .zIndex(1)
                    .offset(x: -6, y: -8)
                
                Image(.shoeRight)
                    .phaseAnimator([false, true]) { mickeyFoot, isTapping in
                        mickeyFoot
                            .rotationEffect(.degrees(isTapping ? -15 : 15), anchor: isTapping ? .bottomTrailing : .topTrailing)
                    } animation: { isTapping in
                            .easeInOut(duration: 0.5)
                    }
                    .offset(x: -46, y: -34)
                
                Image(.shoeLeft)
                    .zIndex(1)
                    .phaseAnimator([false, true]) { mickeyFoot, isTapping in
                        mickeyFoot
                            .rotationEffect(.degrees(isTapping ? 1 : -1), anchor: isTapping ? .bottomLeading : .bottomTrailing)
                    } animation: { isTapping in
                            .easeOut(duration: 0.5)
                    }
                    .offset(x: 40, y: -100)
            }
            
            HStack {
                HStack(spacing: -16) {
                    Image(.mickeyHandRight)
                        .offset(x: -8)
                    
                    ZStack {
                        Image(.mickeyFace)
                            .phaseAnimator([false, true]) { mickeySkirt, isMovingDownUp in
                                mickeySkirt
                                    .offset(y: isMovingDownUp ? -0.5 : 1)
                            } animation: { isMovingDownUp in
                                    .easeOut
                            }
                        
                        VStack {
                            HStack(spacing: 0) {
                                Image(.eyeRight)
                                    .phaseAnimator([false, true]) { mickeyEyeRight, isBlinking in
                                        mickeyEyeRight
                                            .scaleEffect(isBlinking ? 0 : 1)
                                    } animation: { isBlinking in
                                            .timingCurve(0.68, -0.6, 0.32, 1.6).delay(2).repeatForever(autoreverses: false)
                                    }
                                
                                Image(.eyeLeft)
                                    .phaseAnimator([false, true]) { mickeyEyeRight, isBlinking in
                                        mickeyEyeRight
                                            .scaleEffect(isBlinking ? 0.5 : 1)
                                    } animation: { isBlinking in
                                            .timingCurve(0.9, -0.45, 0.32, 1.8).delay(2).repeatForever(autoreverses: false)
                                    }
                            }
                            .offset(x: -16)
                            
                            Image(.tongue)
                                .offset(x: 8, y: 8)
                                .phaseAnimator([false, true]) { mickeyTongue, isLaughing in
                                    mickeyTongue
                                        .scaleEffect(x: isLaughing ? 0.6 : 0.8, anchor: .bottomTrailing)
                                        .scaleEffect(y: isLaughing ? 0.9 : 1, anchor: .topLeading)
                                } animation: { isLaughing in
                                        .easeOut.speed(2).delay(0.01).repeatForever(autoreverses: true)
                                }
                        }
                    }
                    .offset(y: -12)
                    
                    Image(.mickeyHandLeft)
                        .phaseAnimator([false, true]) { mickeyHandLeft, isPointing in
                            mickeyHandLeft
                                .rotationEffect(.degrees(isPointing ? -15 : 15))
                        } animation: { isPointing in
                                .timingCurve(0.68, -0.9, 0.32, 1.6).delay(2).repeatForever(autoreverses: true)
                        }
                        .offset(y: -12)
                }
            }
            .offset(y: -98)
        }
    }
}

#Preview {
    MickeyMouseAnimation()
}
