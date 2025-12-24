//
//  HomeView.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import SwiftUI

struct NavigationListItem: Identifiable {
    let id = UUID()
    let name: String
    let screen: Screen
}

struct HomeView: View {

    private var navigationItems: [NavigationListItem] = [
        NavigationListItem(name: "Ingredients", screen: .ingredients),
        NavigationListItem(name: "Recipes", screen: .recipes),
    ]

    var body: some View {
        VStack {
            List(navigationItems) { item in
                NavigationLink(value: item.screen) {
                    Text(item.name)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
