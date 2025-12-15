//
//  MakeRequest.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

func makeRequest(request: URLRequest) async throws -> (Data) {
    var (data, response): (Data, URLResponse)
    
    print("DEBUG: Reqeust \(request)")

    do {
        (data, response) = try await URLSession.shared.data(for: request)
    } catch {
        throw ApiError.transportError(error)
    }

    guard let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode != 0
    else {
        throw ApiError.serverError(statusCode: -1)
    }

    guard (200..<300).contains(httpResponse.statusCode) else {
        throw ApiError.serverError(statusCode: httpResponse.statusCode)
    }

    return (data)
}
