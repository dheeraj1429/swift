//
//  Videos.swift
//  YoutubeClone
//
//  Created by DHEERAJ on 14/12/25.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
}
