//
//  MusicPlayer.swift
//  SwfitUI
//
//  Created by DHEERAJ on 04/12/25.
//

import SwiftUI
import Combine
import AVFoundation
import MediaPlayer

final class AudioPlayer: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    
    private var player = AVPlayer()
    
}

struct MusicPlayer: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    MusicPlayer()
}
