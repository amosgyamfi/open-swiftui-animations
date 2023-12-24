//
//  XLike1.swift
//  Twitter Like Reaction Animation
//

import SwiftUI

public struct XLike1: View {
    public init() {}
    
    @State private var numberOfLikes: Int = 1
    @State private var isLiked = false
    
    public var body: some View {
        HStack {
            Button {
                isLiked.toggle()
                
                if isLiked {
                    numberOfLikes += 1
                } else {
                    numberOfLikes -= 1
                }
                
            } label: {
                ZStack{
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(isLiked ? .title2 : .title3)
                        .foregroundColor(Color(isLiked ? .systemPink : .systemGray))
                        .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: isLiked)
                    
                    Circle()
                        .strokeBorder(lineWidth: isLiked ? 0 : 35)
                        .animation(.easeInOut(duration: 0.5).delay(0.1),value: isLiked)
                        .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(.systemPink))
                        .hueRotation(.degrees(isLiked ? 300 : 200))
                        .scaleEffect(isLiked ? 1.3 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isLiked)
                    
                    SplashView()
                        .opacity(isLiked ? 0 : 1)
                        .animation(.easeInOut(duration: 0.5).delay(0.25), value: isLiked)
                        .scaleEffect(isLiked ? 1.5 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isLiked)
                    
                    SplashView()
                        .rotationEffect(.degrees(90))
                        .opacity(isLiked ? 0 : 1)
                        .offset(y: isLiked ? 6 : -6)
                        .animation(.easeInOut(duration: 0.5).delay(0.2), value: isLiked)
                        .scaleEffect(isLiked ? 1.5 : 0)
                        .animation(.easeOut(duration: 0.5), value: isLiked)
                }
            }
            Text("\(numberOfLikes)")
                .foregroundColor(Color(isLiked ? .systemPink : .systemGray))
        }
    }
}

#Preview {
    XLike1()
        .preferredColorScheme(.dark)
}
