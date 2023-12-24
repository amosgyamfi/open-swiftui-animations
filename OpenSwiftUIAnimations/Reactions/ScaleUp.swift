//
//  ScaleUp.swift
//  OpenSwiftUIReactions

// MARK: Here the reaction icons scale up from the bottom and back to the original size

import SwiftUI

// Create a list of steps for the animation
enum ReactionScale: CaseIterable {
    // Define the phases of the animation
    // Initial appearance, move the view up and scale
    case initial, move, scale
    
    // Create a computed properties for the effects you want to have
    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: 0.0
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

struct ScaleUp: View {
    @State private var reactionCount = 0
    
    var body: some View {
        HStack {
            Button{
                reactionCount += 1
            } label: {
                Image(.heart)
            }
            .phaseAnimator(
                ReactionScale.allCases,
                trigger: reactionCount // Observe this for changes
            ) { content, phase in
                content
                    .scaleEffect(phase.scale, anchor: .bottom)
                    .offset(y: phase.verticalOffset)
                    .hueRotation(.degrees(phase.chromaRotate))
            } animation: { phase in
                switch phase {
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
    ScaleUp()
}
