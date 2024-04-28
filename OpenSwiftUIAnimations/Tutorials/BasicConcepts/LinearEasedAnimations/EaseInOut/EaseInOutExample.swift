//

import SwiftUI
/*
 Ease-in-ease-out pacing, which causes an animation to begin slowly, accelerate through the middle of its duration, and then slow again before completing.It is suitable for moving objects across/on the screen from one point to another
*/

struct EaseInOutExample: View {
    
    @State private var angle = -60.0
    @State private var scale = 0.25
    @State private var breatheIn = true
    @State private var breatheOut = false
    let flowerColor = Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1))
    
    var body: some View {
        VStack() {
            
                Text("Fern Breathe")
                    .font(.largeTitle)
            
            Spacer()
            Spacer()
        
            ZStack {
                ForEach(0 ..< 6) { item in
                    Image(systemName: "viewfinder")
                    //Image(systemName: "seal")
                    //Image(systemName: "rhombus.fill")
                    //Image(systemName: "shield")
                    //Image(systemName: "pentagon")
                        .font(.system(size: 150))
                        .foregroundColor(flowerColor)
                        .offset(y: -80)
                        .rotationEffect(.degrees(Double(item)) * angle)
                        .scaleEffect(CGFloat(scale))
                        .hueRotation(.degrees(angle))
                        .blendMode(.difference)
                        .animation(.easeInOut(duration: 4).delay(0.75).repeatForever(autoreverses: true), value: scale)
                        .onAppear() {
                            angle = 60.0
                            scale = 1
                        }
                }
            }
            
            Spacer()
            
            ZStack {
                Text("Breathe Out")
                    .opacity(breatheOut ? 0.2 : 1) // Opacity animation
                    .animation(.easeInOut(duration: 4).delay(0.75).repeatForever(autoreverses: true), value: breatheOut)
                    .onAppear {
                         breatheOut.toggle()
                }
                
                Text("Breathe In")
                    .opacity(breatheIn ? 0 : 1)
                    .scaleEffect(breatheIn ? 0.2 : 1, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .animation(.easeInOut(duration: 4).delay(0.75).repeatForever(autoreverses: true), value: breatheIn)
                    .onAppear() {
                        breatheIn.toggle()
                    }
            }
            .padding(.top, 50)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    EaseInOutExample()
}
