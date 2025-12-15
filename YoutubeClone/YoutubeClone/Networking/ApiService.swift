//
//  TvShows.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

final class ApiService {
    static let shared = ApiService()

    private init() {}

    func execute<T: Decodable>(endpoint: Api, type: T.Type) async throws -> T {
        guard let request = try buildRequest(endpoint: endpoint) else {
            // NOTE: The buildRequest logic handles specific URL errors,
            // so this should generally not fail if the endpoint is valid.
            throw ApiError.constructUrl("Failed to create request")
        }

        let data = try await makeRequest(request: request)

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(type, from: data)
        } catch {
            throw ApiError.decodeFail(error)
        }
    }

    func fetchTvShows(page: Int) async throws -> PaginatedResponse<Movie> {
        return try await execute(
            endpoint: .movies(page: page),
            type: PaginatedResponse<Movie>.self
        )
    }

    func searchMovies(query: String) async throws -> PaginatedResponse<Movie> {
        return try await execute(
            endpoint: .searchMovies(query: query),
            type: PaginatedResponse<Movie>.self
        )
    }

    func video(id: Int) async throws -> VideoPaginatedResponse<Video> {
        return try await execute(
            endpoint: .video(id: id),
            type: VideoPaginatedResponse<Video>.self
        )
    }
}
