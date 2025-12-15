//
//  GlowView.swift
//  SwfitUI
//
//  Created by DHEERAJ on 30/11/25.
//

import SwiftUI

struct GlowView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 100))
            .foregroundStyle(.yellow)
            .glow()
    }
}

struct Glow: ViewModifier {
    @State private var glowAnimation: Bool = false
    
    func body(content: Content) -> some View {
        ZStack {
            content.blur(radius: glowAnimation ? 0 : 15)
                .animation(.easeOut(duration: 0.5).repeatForever(), value: glowAnimation)
                .onAppear {
                    glowAnimation.toggle()
                }
            content
        }
    }
}

extension View {
    func glow() -> some View {
        modifier(Glow())
    }
}

#Preview {
    GlowView()
}
