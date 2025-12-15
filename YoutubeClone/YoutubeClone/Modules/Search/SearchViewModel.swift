//
//  SearchViewModel.swift
//  YoutubeClone
//
//  Created by DHEERAJ on 14/12/25.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var debouncedText: String = ""
    @Published var searchResults: PaginatedResponse<Movie>?
    @Published var isSearchLoading: Bool = false
    @Published var searchError: String?

    private static var lastResult: PaginatedResponse<Movie>?

    private var cancellables = Set<AnyCancellable>()

    func clearSearchState() {
        isSearchLoading = false
        searchError = nil
    }

    init() {
        if let lastResult = Self.lastResult {
            self.searchResults = lastResult
        }

        $search
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { value in
                if value.isEmpty { return }
                self.debouncedText = value
                Task {
                    self.clearSearchState()
                    do {
                        self.isSearchLoading = true
                        let result = try await ApiService.shared.searchMovies(
                            query: value
                        )
                        self.searchResults = result
                        self.clearSearchState()
                        Self.lastResult = result
                    } catch {
                        self.clearSearchState()
                        self.searchError = error.localizedDescription
                        print(error)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
