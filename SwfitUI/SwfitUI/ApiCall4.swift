//
//  ApiCall4.swift
//  SwfitUI
//
//  Created by DHEERAJ on 07/12/25.
//

import SwiftUI

struct TvShow: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let firstAirDate: String
    let name: String
    let voteAverage: Double
    let voteCount: Int
}

struct TvShows: Codable {
    let page: Int
    let results: [TvShow]
    let totalPages: Int
    let totalResults: Int
}

enum ApiError: LocalizedError {
    case invalidUrl
    // Capture the specific status code (e.g., 404, 500)
    case serverError(statusCode: Int)
    // Wrap the underlying transport/network error (e.g., no internet, timeout)
    case transportError(Error)
    // Wrap the specific decoding error (e.g., key missing, type mismatch)
    case decodeFail(Error)

    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The provided URL was invalid."
        case .serverError(let code):
            return "Server responded with status code: \(code)."
        case .transportError(let error):
            return "Network connection failed: \(error.localizedDescription)"
        case .decodeFail(_):
            return "Failed to parse data from server."
        }
    }
}

enum Api {
    case tvShows(
        includeAdult: Bool = false,
        includeNullFirstAirDates: Bool = false,
        language: String = "en-US",
        page: Int = 1,
        sortBy: String = "popularity.desc"
    )
}

let apiKey: String = "314e0eb364154825e10072833dc9c184"

extension Api {

    var path: String {
        switch self {
        case .tvShows:
            return "/discover/tv"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .tvShows(
            let includeAdult,
            let includeNullFirstAirDates,
            let language,
            let page,
            let sortBy
        ):
            return [
                URLQueryItem(
                    name: "include_adult",
                    value: "\(includeAdult)"
                ),
                URLQueryItem(
                    name: "include_null_first_air_dates",
                    value: "\(includeNullFirstAirDates)"
                ),
                URLQueryItem(name: "language", value: language),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "sort_by", value: sortBy),
                URLQueryItem(name: "api_key", value: apiKey),
            ]
        }
    }

    var method: String {
        switch self {
        case .tvShows:
            return "GET"
        }
    }
}

func buildRequest(
    endpoint: Api,
    baseUrl: String = "https://api.themoviedb.org/3"
) -> URLRequest? {
    guard var url = URL(string: baseUrl + endpoint.path) else {
        return nil
    }

    if let queryItems = endpoint.queryItems {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        guard let finalUrl = components?.url else { return nil }
        url = finalUrl
    }

    var req = URLRequest(url: url)

    req.httpMethod = endpoint.method.uppercased()

    return req
}

func apiResponse(request: URLRequest) async throws -> (Data) {
    var (data, response): (Data, URLResponse)

    do {
        (data, response) = try await URLSession.shared.data(for: request)
    } catch {
        throw ApiError.transportError(error)
    }

    guard let httpResponse = response as? HTTPURLResponse else {
        throw ApiError.serverError(statusCode: -1)
    }

    guard (200...299).contains(httpResponse.statusCode) else {
        throw ApiError.serverError(statusCode: httpResponse.statusCode)
    }

    return (data)
}

func fetchTvShows() async throws -> TvShows {
    guard let request = buildRequest(endpoint: .tvShows()) else {
        throw ApiError.invalidUrl
    }
    
    let (data) = try await apiResponse(request: request)

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(TvShows.self, from: data)
    } catch {
        throw ApiError.decodeFail(error)
    }
}

struct ApiCall4: View {
    var body: some View {
        Text("Hello, World!")
            .task {
                do {
                    let tvShows = try await fetchTvShows()
                    print("Fetched \(tvShows.results) TV shows.")
                } catch {
                    print("Failed to fetch TV shows: \(error)")
                }
            }
    }
}

#Preview {
    ApiCall4()
}
