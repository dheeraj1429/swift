//
//  NavigationApp.swift
//  Navigation
//
//  Created by DHEERAJ on 28/11/25.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
        }
    }
}


enum AppRoute: Hashable {
    case home
    case details(message: String)
}

class Router: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
