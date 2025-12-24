//
//  Recipes.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 23/12/25.
//

import RealmSwift
import SwiftUI

struct RecipesView: View {
    @EnvironmentObject var router: Router
    @ObservedResults(Recipe.self) var recipes: Results<Recipe>

    let gridColumns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(recipes) { recipe in
                        Button {
                            router.push(
                                .recipeAction(
                                    params: RecipeActionViewParams(
                                        _id: recipe._id,
                                        isEditMode: true
                                    )
                                )
                            )
                        } label: {
                            RecipeCardView(
                                name: recipe.name,
                                createdAt: recipe.createdAt,
                                nameOfIngredients: recipe.ingredients.map({
                                    $0.name
                                })
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .toolbar {
            Button {
                router.push(.recipeAction(params: RecipeActionViewParams()))
            } label: {
                Text("Add recipe")
            }
        }
    }
}

#Preview {
    RecipesView()
        .environment(
            \.realmConfiguration,
            Realm.Configuration.sharedConfig
        )
}
