//
//  LockAnimationView.swift
//  SwiftUICallingKit
//

import SwiftUI

struct LockAnimationView: View {
    @State private var isOpening = false
    let easeInOutBack = Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25).repeatForever(autoreverses: true)
    let lockHandle =  RoundedRectangle(cornerRadius: 9)
    let chevronUp = Image(systemName: "chevron.up")
    
    var body: some View {
        VStack {
            VStack {
                lockHandle
                    .trim(from: 0.3, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 18, height: 24)
                    .offset(y: isOpening ? 20 : 12)
                    .animation(easeInOutBack, value: isOpening)
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 24, height: 24)
            }
            
            chevronUp
                .font(.title)
                .bold()
                .padding(.top)
                .offset(y: isOpening ? 12 : 20)
                .animation(easeInOutBack, value: isOpening)
        }
        .padding(EdgeInsets(top: 16, leading: 12, bottom: 42, trailing: 12))
        .background(Color(.systemGray4))
        .cornerRadius(26)
        .onAppear {
            moveUpDown()
        }
    }
    
    func moveUpDown() {
        isOpening.toggle()
    }
}

struct LockAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LockAnimationView()
            .preferredColorScheme(.dark)
    }
}
