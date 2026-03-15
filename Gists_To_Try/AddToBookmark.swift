//
//  AddToBookmark.swift
//  SwiftUIAnimation2026
//
//  Created by Amos Gyamfi on 16.3.2026.
//

import SwiftUI
import WebKit

struct AddToBookmark: View {
    @State private var urlText: String = "developer.apple.com/"
    @State private var bookmarkTrigger: Int = 0
    let url = URL(string: "https://developer.apple.com")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                WebView(url: url)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        PhaseAnimator([false, true], trigger: bookmarkTrigger) { move in
                            ZStack {
                                Circle()
                                    .trim(from: 0.5, to: 1.0)
                                    .stroke()
                                    .opacity(0)
                                Image(systemName: "safari.fill")
                                    .font(.largeTitle)
                                    .offset(x: -162, y: -17)
                                    .rotationEffect(.degrees(move ? 180.0 : 0.0))
                                    .opacity(move ? 0 : 1)
                                //.scaleEffect(move ? 1 : 0)
                            }
                        } animation: { move in
                            move ? .easeInOut(duration: 1) : .linear(duration: 0)
                        }
                        .offset(y: 240)
                        
                        Spacer()
                    }
                    .padding()
                    
                    bottomBar
                }
            }
            .preferredColorScheme(.dark)
        }
    }
    
    var bottomBar: some View {
        HStack(spacing: 12) {
            Button(action: {}) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 36, height: 36)
                    .background(.black, in: Circle())
            }
            
            HStack(spacing: 32) {
                Image(systemName: "text.justify.left")
                    .font(.system(size: 12))
                    .foregroundStyle(.white.opacity(0.6))
                
                Text(urlText)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                
                Button(action: {}) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .background(.black, in: Capsule())
            
            Menu {
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: { bookmarkTrigger += 1 }) {
                    Label("Add to Bookmarks", systemImage: "bookmark")
                }
                Button(action: {}) {
                    Label("Add Bookmark to...", systemImage: "book")
                }
                Divider()
                Button(action: {}) {
                    Label("New Tab", systemImage: "plus")
                }
                Button(action: {}) {
                    Label("New Private Tab", systemImage: "hand.raised.fill")
                }
                Divider()
                HStack {
                    Button(action: {}) {
                        Label("Bookmarks", systemImage: "book.fill")
                    }
                    Button(action: {}) {
                        Label("All Tabs", systemImage: "rectangle.on.rectangle")
                    }
                }
            } label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 36, height: 36)
                    .background(.black, in: Circle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}

#Preview {
    AddToBookmark()
}
