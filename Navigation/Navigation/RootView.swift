//
//  RootView.swift
//  Navigation
//
//  Created by DHEERAJ on 29/11/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case .details(let message):
                        DetailView(message: message)
                    }
                }
        }
    }
}
