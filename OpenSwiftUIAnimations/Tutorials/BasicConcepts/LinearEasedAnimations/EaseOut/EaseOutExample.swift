
import SwiftUI
/*
 EaseOut pacing causes animation to speed up quickly and slow down as it progresses. You can use it to move objects across/on the screen from one point to another. Think of it as the the motion of a car. It is also useful for moving an object towards another. You can use it for human-initiated animations/interactions. Examples, button tap and  page-to-page transitions.
 */

// In this example, the bell's rotation uses spring animation. It moves into view with easeOut which is more appropriate for moving objects onto the screen.

struct EaseOutExample: View {
    
    @State private var showing = true
    @State private var rotating = false
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .font(.largeTitle)
                .rotationEffect(.degrees(rotating ? 0 : -45), anchor: .top)
                .animation(.spring(response: 0.2, dampingFraction: 0.825/4, blendDuration: 0).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
            
            VStack {
                Text("Silent mode")
                Text("On")
            }
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .background(Color(.systemGray4))
        .cornerRadius(32)
        .offset(y: showing ? -UIScreen.main.bounds.height/1.8 : -UIScreen.main.bounds.height/2.5)
        .onAppear {
            rotating.toggle()
            withAnimation(.easeOut.delay(2)) {
                showing.toggle()
            }
        }
    }
}

#Preview {
    EaseOutExample()
}
