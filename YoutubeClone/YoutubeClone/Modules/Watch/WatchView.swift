//
//  WatchView.swift
//  YtClone
//
//  Created by DHEERAJ on 11/12/25.
//

import SwiftUI
import YouTubePlayerKit

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
    }
}

struct WatchViewParamPayload: Identifiable, Hashable {
    let id: Int
    let title: String
    let postrerUrl: String
}

struct WatchView: View {
    let params: WatchViewParamPayload

    @StateObject private var watchViewModel = WatchViewModel()

    var body: some View {
        VStack(alignment: .leading, content: {
            if let videos = watchViewModel.videos?.results {
                YouTubePlayerView(
                    YouTubePlayer(
                        stringLiteral: Constants.youtubeWatchUrl
                        + "?v=\(videos.randomElement()!.key)"
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: 280)
            }else {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .foregroundStyle(Color(.systemGray4))
            }

            VStack(
                alignment: .leading,
                spacing: 8,
                content: {
                    Text(params.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    HStack(
                        spacing: 5,
                        content: {
                            Text(Mock.username)
                            Text(Mock.views)
                            Text(Mock.time)
                        }
                    )
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray))
                }
            )
            .padding(.horizontal, 5)
            .padding(.vertical, 4)

            Spacer()
        })
        .alert(
            "Error",
            isPresented: watchViewModel.isErrorAlertPresented,
            actions: {
                Button("OK") {
                    watchViewModel.clearMoviesError()
                }
            },
            message: {
                Text(
                    watchViewModel.fetchVideoError
                        ?? "An unknown error occurred."
                )
            }
        )
        .task {
            await watchViewModel.fetchVideos(id: params.id)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    WatchView(
        params: WatchViewParamPayload(
            id: 1_084_242,
            title: Mock.title,
            postrerUrl: Mock.posterUrl
        )
    )
}
