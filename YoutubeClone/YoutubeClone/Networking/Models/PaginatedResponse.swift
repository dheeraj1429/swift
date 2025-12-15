//
//  PaginatedResponse.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import Foundation

struct PaginatedResponse<T: Codable>: Codable {
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [T]
}

struct VideoPaginatedResponse<T: Codable>: Codable, Identifiable {
    var id: Int
    var results: [T]
}
