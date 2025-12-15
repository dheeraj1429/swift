//
//  LikeButton.swift
//  SwfitUI
//
//  Created by DHEERAJ on 30/11/25.
//

import SwiftUI

struct LikeButton: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            Button {
                isOn.toggle()
            } label: {
                ZStack {
                    image(
                        Image(systemName: "heart"),
                        show: !isOn
                    )
                    image(
                        Image(systemName: "heart.fill"),
                        show: isOn
                    )
                }

            }
        }
    }

    func image(_ image: Image, show: Bool) -> some View {
        image
            .font(.system(size: 100))
            .foregroundStyle(Color(!isOn ? .white : .red))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
}

#Preview {
    LikeButton()
}
