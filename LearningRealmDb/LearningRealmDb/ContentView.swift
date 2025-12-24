//
//  ContentView.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import RealmSwift
import SwiftUI

struct ContentView: View {
    @StateObject var router = Router()

    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .home:
                    HomeView()
                case .ingredients:
                    IngredientsView()
                case .ingredientAction(let params):
                    IngredientAction(params: params)
                case .recipes:
                    RecipesView()
                case .recipeAction(let params):
                    RecipeActionView(params: params)
                }
            }
        }
        .environment(
            \.realmConfiguration,
            Realm.Configuration.sharedConfig
        )
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
