//
//  RecipeAction.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 23/12/25.
//

import RealmSwift
import SwiftUI

struct RecipeActionViewParams: Hashable {
    var _id: ObjectId?
    var isEditMode: Bool = false
}

struct RecipeActionView: View {
    @EnvironmentObject var router: Router
    @ObservedResults(Ingredient.self) var ingredients: Results<Ingredient>
    @StateObject var recipeActionViewModel = RecipeActionViewModel()

    let params: RecipeActionViewParams

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10,
            content: {
                TextField(
                    "Enter recipe name",
                    text: $recipeActionViewModel.name
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Menu("Ingredients") {
                    ForEach(ingredients) { ingredient in
                        Button {
                            recipeActionViewModel.selectedIngredient(
                                ingredientId: ingredient._id
                            )
                        } label: {
                            HStack {
                                Text(ingredient.name)
                            }
                        }
                    }
                }

                Spacer()
            }
        )
        .onAppear {
            if let recipeId = params._id {
                recipeActionViewModel.getRecipeById(recipeId)
            }
            recipeActionViewModel.setRouter(router)
        }
        .padding(.horizontal, 10)
        .toolbar {
            Button {
                if params.isEditMode {

                } else {
                    recipeActionViewModel.save()
                }
            } label: {
                Text(params.isEditMode ? "Update recipe" : "Save recipe")
            }
        }
        .alert(
            "Error",
            isPresented: recipeActionViewModel.isShowAlert
        ) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(recipeActionViewModel.errorMessage ?? "")
        }
    }
}

#Preview {
    let router = Router()

    RecipeActionView(params: RecipeActionViewParams())
        .environment(
            \.realmConfiguration,
            Realm.Configuration.sharedConfig
        )
        .environmentObject(router)
}
