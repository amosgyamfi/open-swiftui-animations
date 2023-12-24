//
//  ContentView.swift
//  OpenSwiftUIAnimations

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.white.opacity(0.5)]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
                .blur(radius: 20)
            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell.fill")
                    .font(.system(size: 128))
                    .foregroundStyle(.white)
                    .phaseAnimator([false, true]) { bell, animateBell in
                        
                        bell
                            .rotationEffect(.degrees(animateBell ? -45 : 0), anchor: .top)
                    } animation: { animateBell in
                            //.easeInOut(duration: 0.5).delay(2)
                            .bouncy(duration: 1.5, extraBounce: 0.6)
                    }
                
                Image(systemName: "circle.fill")
                    .font(.system(size: 128/3))
                    .foregroundStyle(.blue)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 24))
                    .phaseAnimator([false, true]) { badge, animateBadge in
                        
                        badge
                            .scaleEffect(animateBadge ? 1 : 1.2)
                    } animation: { animateBadge in
                            //.easeInOut(duration: 0.5).delay(2)
                            .bouncy(duration: 1.5, extraBounce: 0.2)
                    }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
