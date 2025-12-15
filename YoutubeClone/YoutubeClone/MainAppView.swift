//
//  ContentView.swift
//  YtClone
//
//  Created by DHEERAJ on 09/12/25.
//

import SwiftUI

struct MainAppView: View {
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }

                Tab("Shorts", systemImage: "airplay.video.circle.fill") {}

                Tab("Subscriptions", systemImage: "video.badge.waveform.fill") {
                }

                Tab("Library", systemImage: "text.below.folder.fill") {}
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .home:
                    HomeView()
                case .watch(let params):
                    WatchView(params: params)
                case .search:
                    SearchView()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    MainAppView()
}
