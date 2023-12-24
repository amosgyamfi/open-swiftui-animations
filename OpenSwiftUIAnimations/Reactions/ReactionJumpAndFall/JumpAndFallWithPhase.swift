//
//  JumpAndFallWithPhase.swift
//  OpenSwiftUIAnimations
//


import SwiftUI

// Create a list of steps for the animation
enum Reaction: CaseIterable {
    // Define the phases of the animation
    // Initial appearance, move the view up and scale
    case initial, move, scale
    
    // Create a computed properties for the effects you want to have
    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: -64
        }
    }
    
    var scale: Double {
        switch self {
        case .initial: 1
        case .move, .scale: 2.0
        }
    }
    
    var chromaRotate: Double {
        switch self {
        case .initial: 0.0
        case .move, .scale: 225.0
        }
    }
}

struct JumpAndFallWithPhase: View {
    @State private var reactionCount = 0
    
    var body: some View {
        HStack {
            Button{
                reactionCount += 1
            } label: {
                Image(.heart)
            }
            .phaseAnimator(
                Reaction.allCases,
                trigger: reactionCount
            ) { heartSymbol, jump in
                heartSymbol
                    .scaleEffect(jump.scale)
                    .offset(y: jump.verticalOffset)
                    .hueRotation(.degrees(jump.chromaRotate))
            } animation: { jump in
                switch jump {
                case .initial: .bouncy(duration: 0.5, extraBounce: 0.25)
                case .move: .easeInOut(duration: 0.3).delay(0.25)
                case .scale: .spring(duration: 0.5, bounce: 0.7)
                }
            }
            
            Button(
                "",
                image: .thumbsupReaction,
                action: nothing
            )
            
            Button(
                "",
                image: .thumbsdownReaction,
                action: nothing
            )
            
            Button(
                "",
                image: .lolReaction,
                action: nothing
            )
            
            Button(
                "",
                image: .wutReaction,
                action: nothing
            )
        }
        
    }
    
    func nothing() {}
}

#Preview {
    JumpAndFallWithPhase()
        .preferredColorScheme(.dark)
}
