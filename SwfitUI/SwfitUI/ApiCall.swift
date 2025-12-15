//
//  ApiCall.swift
//  SwfitUI
//
//  Created by DHEERAJ on 03/12/25.
//

import SwiftUI

struct ApiCall: View {
    func getUser() async throws -> User {
        let endPoint = "https://api.github.com/users/Dheeraj1429"

        guard let url = URL(string: endPoint) else {
            throw GHError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw GHError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(User.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }

    var body: some View {
        Text("Hello, World!")
            .task {
                do {
                    let user = try await getUser()
                    print("user \(user)")
                } catch {
                    print("Api error \(error)")
                }
            }
    }
}

struct User: Codable {
    var login: String
    var id: Int
    var nodeId: String
    var avatarUrl: String
    var url: String
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

#Preview {
    ApiCall()
}
