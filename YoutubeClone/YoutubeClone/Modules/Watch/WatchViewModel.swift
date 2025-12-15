//
//  WatchViewModel.swift
//  YoutubeClone
//
//  Created by DHEERAJ on 14/12/25.
//

import Combine
import Foundation
import SwiftUI

class WatchViewModel: ObservableObject {
    @Published var videos: VideoPaginatedResponse<Video>?
    @Published var isVideoFetching: Bool = false
    @Published var fetchVideoError: String?

    var isErrorAlertPresented: Binding<Bool> {
        Binding(
            get: { self.fetchVideoError != nil },
            set: { newValue in
                if !newValue {
                    self.clearMoviesError()
                }
            }
        )

    }

    func fetchVideos(id: Int) async {
        print(id)
        do {
            isVideoFetching = true
            videos = try await ApiService.shared.video(id: id)
        } catch {
            fetchVideoError = error.localizedDescription
            print(error)
        }
        isVideoFetching = false
    }

    func clearMoviesError() {
        fetchVideoError = nil
    }
}
