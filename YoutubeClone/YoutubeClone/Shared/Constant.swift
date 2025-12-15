//
//  Constant.swift
//  YtClone
//
//  Created by DHEERAJ on 09/12/25.
//

import Foundation

enum Constants {
    static let defaultSidePadding: CGFloat = 16

    static let tmdbApiBaseUrl: String = "https://api.themoviedb.org/3"
    static let posterBaseUrl: String = "https://image.tmdb.org/t/p/original"
    
    static let youtubeWatchUrl: String = "https://youtube.com/watch"
}

enum ENV: String {
    case TMDB_API_KEY = "TMDB_API_KEY"
}

// This enum only contains mock data which used only in development
enum Mock {
    static let userProfileUrl: String =
        "https://images.unsplash.com/photo-1654110455429-cf322b40a906?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    static let posterUrl: String = "/chpWmskl3aKm1aTZqUHRCtviwPy.jpg"

    static let title: String =
        "Advance Swiftui Animations"
    static let subtitle: String =
        "Demo content refers to pre-populated, placeholder data or mock-up content used to demonstrate how a product"
    static let username: String = "@dheerajsr"
    static let views: String = "1.2M Views"
    static let time: String = "8 months ago"
}

enum Screen: Hashable {
    case home
    case watch(params: WatchViewParamPayload)
    case search
}
