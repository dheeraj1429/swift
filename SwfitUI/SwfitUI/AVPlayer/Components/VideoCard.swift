//
//  VideoCard.swift
//  SwfitUI
//
//  Created by DHEERAJ on 02/12/25.
//

import SwiftUI

struct VideoCard: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(5)
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(5)
                }

                VStack(
                    alignment: .leading,
                    spacing: 3,
                    content: {
                        Text("title")
                            .font(.caption)

                        Text("Subtitle")
                            .font(.caption2)
                    }
                )
                .padding()
            }
            
            Image(systemName: "play.fill")
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
    }
}

#Preview {
    VideoCard()
}
