//
//  ApiCall3.swift
//  SwfitUI
//
//  Created by DHEERAJ on 07/12/25.
//

import SwiftUI


//struct TvShow: Codable, Identifiable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIds: [Int]
//    let id: Int
//    let originCountry: [String]
//    let originalLanguage: String
//    let originalName: String
//    let overview: String
//    let popularity: Double
//    let posterPath: String
//    let firstAirDate: String
//    let name: String
//    let voteAverage: Double
//    let voteCount: Int
//}
//
//struct TvShows: Codable {
//    let page: Int
//    let results: [TvShow]
//    let totalPages: Int
//    let totalResults: Int
//}
//
//enum ApiError: LocalizedError {
//    case invalidUrl
//    // Capture the specific status code (e.g., 404, 500)
//    case serverError(statusCode: Int)
//    // Wrap the underlying transport/network error (e.g., no internet, timeout)
//    case transportError(Error)
//    // Wrap the specific decoding error (e.g., key missing, type mismatch)
//    case decodeFail(Error)
//
//    var errorDescription: String? {
//        switch self {
//        case .invalidUrl:
//            return "The provided URL was invalid."
//        case .serverError(let code):
//            return "Server responded with status code: \(code)."
//        case .transportError(let error):
//            return "Network connection failed: \(error.localizedDescription)"
//        case .decodeFail(_):
//            return "Failed to parse data from server."
//        }
//    }
//}

//let apiKey = "314e0eb364154825e10072833dc9c184"

//func fetchTvShowes() async throws -> TvShows {
//    guard let url = URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=\(apiKey)") else {
//        throw ApiError.invalidUrl
//    }
//    
//    let request = URLRequest(url: url)
//    
//    var (data, response): (Data, URLResponse)
//    
//    do {
//        (data, response) = try await URLSession.shared.data(for: request)
//    } catch {
//        throw ApiError.transportError(error)
//    }
//    
//    guard let httpResponse = response as? HTTPURLResponse else {
//        throw ApiError.serverError(statusCode: -1)
//    }
//    
//    guard (200...299).contains(httpResponse.statusCode) else {
//        throw ApiError.serverError(statusCode: httpResponse.statusCode)
//    }
//    
//    do {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return try decoder.decode(TvShows.self, from: data)
//    }catch {
//        throw ApiError.decodeFail(error)
//    }
//}


struct ApiCall3: View {
    var body: some View {
        Text("Hello, World!")
//            .task {
//                do {
//                    let tvShows = try await fetchTvShowes()
//                    print("Fetched \(tvShows.results) TV shows.")
//                } catch {
//                    print("Failed to fetch TV shows: \(error)")
//                }
//            }
    }
}

#Preview {
    ApiCall3()
}
