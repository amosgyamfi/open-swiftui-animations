//
//  EaseInExample.swift
// This example makes a bell icon slide through the top edge from the screen to disappear.

/*
EaseIn also refers to as acceleration. It begins slowly but its velocity increases over time. You can use it for auto-initiated animations and to move objects off the screen. It is purposely used for animating objects that require less attention. For example, making a bell icon slide through the top edge from the screen.
 */


import SwiftUI

struct EaseInExample: View {
    
    @State private var showing = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bell.fill")
                    .font(.largeTitle)
                
                VStack {
                    Text("Silent mode")
                    Text("On")
                }
            }
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .background(Color(.systemGray4))
            .cornerRadius(32)
            // Make the view disappear using easeIn
            .offset(y: showing ? -UIScreen.main.bounds.height : 0)
            .onAppear {
                withAnimation(.easeIn.delay(1)) {
                    showing.toggle()
                }
        }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EaseInExample()
}
