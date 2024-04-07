//
//  WWDC24Invite.swift
//  OpenSwiftUIAnimations
//
//  Created by Amos Gyamfi on 5.4.2024.
//

import SwiftUI

struct WWDC24Invite: View {
    var body: some View {
        ZStack {
            Image(.wwdc24Invite)
                .resizable()
                .scaledToFit()
                .phaseAnimator([false, true]) { wwdc24, chromaRotate in
                    wwdc24
                        .hueRotation(.degrees(chromaRotate ? 420 : 0))
                } animation: { chromaRotate in
                        .easeInOut(duration: 2)
                }
        }
    }
}

#Preview {
    WWDC24Invite()
        .preferredColorScheme(.dark)
}
