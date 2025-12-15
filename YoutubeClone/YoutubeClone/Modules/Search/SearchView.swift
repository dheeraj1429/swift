//
//  SearchView.swift
//  YoutubeClone
//
//  Created by DHEERAJ on 14/12/25.
//

import Combine
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var router: Router

    @StateObject private var searchViewModel = SearchViewModel()

    var body: some View {
        VStack(
            spacing: 8,
            content: {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        if let searchResults = searchViewModel.searchResults {
                            ForEach(searchResults.results) { movie in
                                Button {
                                    router.push(
                                        .watch(
                                            params: WatchViewParamPayload(
                                                id: movie.id,
                                                title: movie.title,
                                                postrerUrl: movie.posterPath ?? ""
                                            )
                                        )
                                    )
                                } label: {
                                    SearchListItem(title: movie.title)
                                }
                                .buttonStyle(.plain)
                                Divider()
                            }
                        }
                    }
                }

                Spacer()
            }
        )
        .searchable(text: $searchViewModel.search, prompt: "Search YouTube")
        .navigationTitle("Search YouTube")
    }
}

#Preview {
    SearchView()
}
