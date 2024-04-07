//
//  LinearAndEasedAnimations.swift
//  OpenSwiftUIAnimations
//
//  Getting SwiftUI's Linear and Eased Animations
//

import SwiftUI

struct LinearAndEasedAnimations: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Circle()
                        .frame(width: 50, height: 50)
                        .phaseAnimator([false, true]) { circle, move in
                            circle
                                .foregroundStyle(move ? .red : .blue)
                                .offset(x: move ? 260 : 0)
                        } animation: { move in
                                .linear(duration: 2).delay(0.2)
                        }
                    
                }  header: {
                    Text("Linear")
                } footer: {
                    Text("No change in speed: Best for activity indicators")
                }
                
                Section {
                    Circle()
                        .frame(width: 50, height: 50)
                        .phaseAnimator([false, true]) { circle, move in
                            circle
                                .foregroundStyle(move ? .red : .blue)
                                .offset(x: move ? 260 : 0)
                        } animation: { move in
                                .easeIn(duration: 2).delay(0.2)
                        }
                    
                }  header: {
                    Text("Ease In")
                } footer: {
                    Text("The motion starts slowly and increases its speed towards the end")
                }
                
                Section {
                    Circle()
                        .frame(width: 50, height: 50)
                        .phaseAnimator([false, true]) { circle, move in
                            circle
                                .foregroundStyle(move ? .red : .blue)
                                .offset(x: move ? 260 : 0)
                        } animation: { move in
                                .easeOut(duration: 2).delay(0.2)
                        }
                    
                }  header: {
                    Text("Ease Out")
                } footer: {
                    Text("The motion starts quickly and decreases its speed towards the end.")
                }
                
                Section {
                    Circle()
                        .frame(width: 50, height: 50)
                        .phaseAnimator([false, true]) { circle, move in
                            circle
                                .foregroundStyle(move ? .red : .blue)
                                .offset(x: move ? 260 : 0)
                        } animation: { move in
                                .easeInOut(duration: 2).delay(0.2)
                        }
                    
                }  header: {
                    Text("Ease-in-out")
                } footer: {
                    Text("The animation starts slowly, increasing its speed towards the halfway point, and finally decreasing the speed towards the end ")
                }
            }
            .listStyle(.inset)
            .navigationTitle("Linear and Eased Aniomations")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LinearAndEasedAnimations()
        .preferredColorScheme(.dark)
}
