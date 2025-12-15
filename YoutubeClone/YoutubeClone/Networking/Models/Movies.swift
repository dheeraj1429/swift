//
//  Movies.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

struct Movie: Codable, Identifiable, Equatable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
