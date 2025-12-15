//
//  SlideAnimation.swift
//  SwfitUI
//
//  Created by DHEERAJ on 30/11/25.
//

import SwiftUI

struct SlideAnimation: View {
    @State private var moveGradient: Bool = true

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width

            Rectangle()
                .overlay {
                    LinearGradient(
                        colors: [.clear, .white, .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .offset(
                        x: moveGradient ? -screenWidth / 2 : screenWidth / 2
                    )
                }
                .animation(
                    .linear(duration: 2).repeatForever(autoreverses: false),
                    value: moveGradient
                )
                .mask {
                    Text("Slide to power off")
                        .font(.largeTitle)
                }
                .onAppear {
                    moveGradient.toggle()
                }
                .background(.gray)
        }
    }
}

#Preview {
    SlideAnimation()
}
