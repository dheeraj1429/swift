//
//  HomeViewModel.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Combine
import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var movies: PaginatedResponse<Movie>? = nil
    @Published var isFetchingMoviesLoading: Bool = false
    @Published var moviesErrorMessage: String? = nil
    @Published var fetchMoviesCurrentPage: Int = 1

    func fetchMovies(page: Int) async {
        isFetchingMoviesLoading = true
        clearMoviesError()

        do {
            let response: PaginatedResponse<Movie> =
                try await ApiService.shared.fetchTvShows(page: page)
            if let existingMovies = movies {
                let combinedResults = existingMovies.results + response.results
                let newPaginatedResponse = PaginatedResponse<Movie>(
                    page: response.page,
                    totalPages: response.totalPages,
                    totalResults: response.totalResults,
                    results: combinedResults
                )
                movies = newPaginatedResponse
            } else {
                movies = response
            }
        } catch {
            moviesErrorMessage = error.localizedDescription
            print(error.localizedDescription)
        }

        isFetchingMoviesLoading = false
    }

    func clearMoviesError() {
        moviesErrorMessage = nil
    }

    var isErrorAlertPresented: Binding<Bool> {
        Binding(
            get: { self.moviesErrorMessage != nil },
            set: { newValue in
                if !newValue {
                    self.clearMoviesError()
                }
            }
        )
    }
}
