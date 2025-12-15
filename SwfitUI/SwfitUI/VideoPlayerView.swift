//
//  VideoPlayerView.swift
//  SwfitUI
//
//  Created by DHEERAJ on 01/12/25.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    @State private var player: AVPlayer = {
        guard
            let url = Bundle.main.url(
                forResource: "14718893_1080_1920_24fps",
                withExtension: "mp4"
            )
        else {
            fatalError("Video file not found in bundle.")
        }
        return AVPlayer(url: url)
    }()

    var body: some View {
        VStack {
//            VideoPlayer(player: player)
//                .frame(width: 500, height: 400)
//            Button("Play") {
//                player.play()
//            }
//            Button("Pause") {
//                player.pause()
//            }
        }
    }
}

#Preview {
    VideoPlayerView()
}
