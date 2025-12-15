//
//  Utiles.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

enum ApiError: LocalizedError {
    case invalidUrl
    // Capture the specific status code (e.g., 404, 500)
    case serverError(statusCode: Int)
    // Wrap the underlying transport/network error (e.g., no internet, timeout)
    case transportError(Error)
    // Wrap the specific decoding error (e.g., key missing, type mismatch)
    case decodeFail(Error)

    case misingEnvKey(String)

    case constructUrl(String)

    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The provided URL was invalid."
        case .serverError(let code):
            return "Server responded with status code: \(code)."
        case .transportError(let error):
            return "Network connection failed: \(error.localizedDescription)"
        case .decodeFail(let error):
            return
                "Failed to parse data from server. \(error.localizedDescription)"
        case .misingEnvKey(let key):
            return "Failed to get value for key: \(key) from the env."
        case .constructUrl(let url):
            return "Failure in constructing url: \(url)."
        }
    }
}

enum Api {
    case movies(
        includeAdult: Bool? = false,
        includeNullFirstAirDates: Bool? = false,
        page: Int? = 1,
        sortBy: String? = "popularity.desc"
    )

    case searchMovies(
        query: String,
        includeAdult: Bool? = false,
        language: String? = "en-US",
        page: Int? = 1
    )

    case video(id: Int)
}

extension Api {
    var path: String {
        switch self {
        case .movies:
            return "/discover/movie"
        case .searchMovies:
            return "/search/movie"
        case .video(let id):
            return "/movie/\(id)/videos"
        }
    }

    var method: String {
        switch self {
        default:
            return "GET"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .movies(
            let includeAdult,
            let includeNullFirstAirDates,
            let page,
            let sortBy
        ):
            return [
                URLQueryItem(
                    name: "include_adult",
                    value: "\(includeAdult ?? false)"
                ),
                URLQueryItem(
                    name: "include_video",
                    value: "\(includeNullFirstAirDates ?? false)"
                ),
                URLQueryItem(name: "page", value: "\(page ?? 1)"),
                URLQueryItem(name: "sort_by", value: sortBy),
            ]

        case .searchMovies(let query, let includeAdult, let language, let page):
            return [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(
                    name: "include_adult",
                    value: "\(includeAdult ?? false)"
                ),
                URLQueryItem(name: "include_adult", value: language),
                URLQueryItem(name: "page", value: "\(page ?? 1)"),
            ]

        default:
            return []
        }
    }
}
