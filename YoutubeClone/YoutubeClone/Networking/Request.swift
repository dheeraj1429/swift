//
//  Request.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

func buildRequest(endpoint: Api) throws -> URLRequest? {
    guard
        let tmdbApiKey = Bundle.main.object(
            forInfoDictionaryKey: ENV.TMDB_API_KEY.rawValue
        ) as? String
    else {
        throw ApiError.misingEnvKey(ENV.TMDB_API_KEY.rawValue)
    }

    guard var url = URL(string: Constants.tmdbApiBaseUrl + endpoint.path) else {
        throw ApiError.constructUrl(Constants.tmdbApiBaseUrl + endpoint.path)
    }

    if var queryItems = endpoint.queryItems {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)

        queryItems.append(
            contentsOf: [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(
                    name: "api_key",
                    value: cleanConfigValue(tmdbApiKey)
                ),
            ]
        )
        components?.queryItems = queryItems
        guard let finalUrl = components?.url else {
            throw ApiError.constructUrl("In the components query items")
        }
        url = finalUrl
    }

    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.uppercased()

    return request
}
