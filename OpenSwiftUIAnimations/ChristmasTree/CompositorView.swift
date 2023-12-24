//
//  CompositorView.swift
//  SwiftUIChristmasTree
//
//  Created by amos @getstream.io on 23.12.2023.
//

import SwiftUI

struct CompositorView: View {
    var body: some View {
        VStack(spacing: -24) {
            XmasSurpriseView()
                .scaleEffect(0.12)
                .frame(width: 48, height: 64)
                .offset(x: -5)
            
            VStack{
                SwiftUIXmasTree()
                
                Spacer()
                
                HStack{
                    HStack{
                        HeartWithRibbonView()
                            .offset(y: -26)
                        GiftWithRibbonView()
                            .offset(y: -14)
                    }
                    .padding(.horizontal, 50)
                    
                    HStack{
                        MrsClausView()
                            .offset(y: -14)
                        FatherChristmasView()
                            .offset(y: -26)
                        MxClausView()
                            .offset(y: -46)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CompositorView()
        .preferredColorScheme(.dark)
}
