//
//  XmasSurpriseView.swift
//  SwiftUIChristmasTree

import SwiftUI

struct XmasSurpriseView: View {
    var body: some View {
        ZStack {
            Image(.xmasSurprise)
            VStack{
                HStack {
                    Image(.eyeRight)
                        .offset(x: -6, y: 22)
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
                                .timingCurve(0.9, -0.45, 0.39, 1.9).delay(2).repeatForever(autoreverses: false)
                        }
                        .offset(x: 44, y: 22)
                }
                
                Image(.mouth)
                    .offset(x: 18, y: 12)
                    .phaseAnimator([false, true]) { mickeyTongue, isLaughing in
                        mickeyTongue
                            .scaleEffect(x: isLaughing ? 0.6 : 0.8, anchor: .bottomTrailing)
                            .scaleEffect(y: isLaughing ? 0.9 : 1, anchor: .topLeading)
                    } animation: { isLaughing in
                            .easeOut.speed(2).delay(0.01).repeatForever(autoreverses: true)
                    }
            }
           
        }
        .frame(width: 48, height: 64)
    }
}

#Preview {
    XmasSurpriseView()
        .preferredColorScheme(.dark)
}
