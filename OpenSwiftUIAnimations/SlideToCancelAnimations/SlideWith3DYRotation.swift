//
//  SlideWith3DYRotation.swift
//  SwiftUICallingKit
//

import SwiftUI

struct SlideWith3DYRotation: View {
    @State private var counter: Int = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let slideGently = Animation.easeOut(duration: 1).delay(2).repeatForever(autoreverses: false).delay(-0.67)
    
    let letters = Array("Slide to cancel")
    @State private var rotation: Double = 0
    @State private var isSliding: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                HStack {
                    HStack{
                        Image(systemName: "mic.fill")
                            .font(.title)
                            .bold()
                            .opacity(isSliding ? 0 : 1)
                            .foregroundColor(Color(.systemRed))
                            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isSliding)
                        
                        Text("\(counter)")
                            .onReceive(timer) { _ in
                                counter += 1
                            }
                            .monospacedDigit()
                    }
                    
                    Spacer()
                    
                    HStack {
                        // Add text here
                        HStack(spacing: 0) {
                            ForEach(0..<letters.count, id:  \.self) { slide in
                                Text(String(letters[slide]))
                                    .foregroundColor(.blue)
                                    .scaleEffect(isSliding ? 0.25 : 1)
                                    .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: -1, z: 0))
                                    .opacity(isSliding ? 0 : 1)
                                    .hueRotation(.degrees(isSliding ? 320 : 0))
                                    .animation(.easeOut(duration: 1).delay(2).repeatForever(autoreverses: false).delay(Double(-slide) / 20), value: isSliding)
                            }
                        }
                        
                        // Add chevron left here
                        Image(systemName: "chevron.left")
                            .font(.subheadline)
                            .bold()
                            .scaleEffect(isSliding ? 0.25 : 1)
                            .opacity(isSliding ? 0 : 1)
                            .offset(x: isSliding ? -50 : 1)
                            .animation(slideGently, value: isSliding)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "mic")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .background(Color(.systemGray4))
                .cornerRadius(32)
                
                LockAnimationView()
            }
            .onAppear {
                rotation = 360
                isSliding = true
            }
        }
        .padding()
    }
}

struct SlideWith3DYRotation_Previews: PreviewProvider {
    static var previews: some View {
        SlideWith3DYRotation()
            .preferredColorScheme(.dark)
    }
}
