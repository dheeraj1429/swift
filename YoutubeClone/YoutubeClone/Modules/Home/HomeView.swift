//
//  HomeView.swift
//  YtClone
//
//  Created by DHEERAJ on 09/12/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            NavbarView()

            Spacer()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(
                    spacing: 10,
                    content: {
                        if let movies = homeViewModel.movies?.results {
                            ForEach(movies) { movie in
                                CardView(
                                    posterUrl: movie.posterPath ?? "",
                                    title: movie.title,
                                    subTitle: safeTruncate(
                                        movie.overview,
                                        maxLength: 150
                                    ),
                                    action: {
                                        router.push(
                                            .watch(
                                                params: WatchViewParamPayload(
                                                    id: movie.id,
                                                    title: movie.title,
                                                    postrerUrl: movie.posterPath
                                                        ?? ""
                                                )
                                            )
                                        )
                                    }
                                )
                                .onAppear {
                                    if movie == movies.last {
                                        Task {
                                            let nextPage = homeViewModel.fetchMoviesCurrentPage + 1
                                            homeViewModel.fetchMoviesCurrentPage = nextPage
                                            await homeViewModel.fetchMovies(
                                                page: nextPage
                                            )
                                        }
                                    }
                                }
                            }
                        }

                        if homeViewModel.isFetchingMoviesLoading {
                            ProgressView()
                        }
                    }
                )
            }
        }
        .alert(
            "Error",
            isPresented: homeViewModel.isErrorAlertPresented,
            actions: {
                Button("OK") {
                    homeViewModel.clearMoviesError()
                }
            },
            message: {
                Text(
                    homeViewModel.moviesErrorMessage
                        ?? "An unknown error occurred."
                )
            }
        )
        .task {
            await homeViewModel.fetchMovies(
                page: homeViewModel.fetchMoviesCurrentPage
            )
        }
    }
}

#Preview {
    HomeView()
}
