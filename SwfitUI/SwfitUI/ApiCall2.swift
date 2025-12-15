//
//  ApiCall2.swift
//  SwfitUI
//
//  Created by DHEERAJ on 04/12/25.
//

import SwiftUI

struct ApiCall2: View {
    @State var postsData: [Post] = []

    func getPosts() async throws -> [Post] {
        let endpoint = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: endpoint) else {
            throw AppError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse,
            (200...299).contains(http.statusCode)
        else {
            let status = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw AppError.serverError(status)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Post].self, from: data)
        } catch {
            throw AppError.decodingFaild
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                ForEach(postsData) { post in
                    VStack(spacing: 10, content: {
                        Text("User id \(post.userId)")
                        Text("Id \(post.id)")
                        Text("Title \(post.title)")
                        Text("Body \(post.body)")
                    })
                }
            }
        }.task {
            do {
                postsData = try await getPosts()
            } catch {
                print("ERROR \(error.localizedDescription)")
            }
        }

    }
}

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum AppError: LocalizedError {
    case invalidUrl
    case decodingFaild
    case serverError(Int)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "This URL is invalid."
        case .decodingFaild:
            return "Failed to decode the response."
        case .serverError(let code):
            return "Server error with code: \(code)."
        case .unknown:
            return "Something went wrong."
        }
    }
}

#Preview {
    ApiCall2()
}
