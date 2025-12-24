//
//  RecipeActionViewModel.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 23/12/25.
//

import Combine
import Foundation
import RealmSwift
import SwiftUI

class RecipeActionViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    @Published var selectedIngredients: [Ingredient] = []

    private(set) var router: Router? = nil

    var isShowAlert: Binding<Bool> {
        Binding(
            get: {
                self.errorMessage != nil
            },
            set: { newValue in
                if !newValue {
                    self.errorMessage = nil
                }
            }
        )
    }

    func setRouter(_ router: Router) {
        self.router = router
    }

    func isIngredientSelected(_ ingredientId: ObjectId) -> Bool {
        return selectedIngredients.contains(where: {
            $0._id == ingredientId
        })
    }

    func selectedIngredient(ingredientId: ObjectId) {
        do {
            let realm = try Realm()

            if self.isIngredientSelected(ingredientId) {
                guard
                    let index = selectedIngredients.firstIndex(where: {
                        $0._id == ingredientId
                    })
                else {
                    errorMessage = "Error during finding the ingredient index"
                    return
                }

                selectedIngredients.remove(at: index)
            } else {
                guard
                    let ingredient = realm.object(
                        ofType: Ingredient.self,
                        forPrimaryKey: ingredientId
                    )
                else {
                    errorMessage =
                        "Not able to find the ingredient with _id: \(ingredientId)"
                    return
                }

                selectedIngredients.append(ingredient)
            }
        } catch {
            errorMessage =
                "Error during select ingredient \(error.localizedDescription)"
        }
    }

    func save() {
        isLoading = true
        guard !name.isEmpty else {
            errorMessage = "Please provide the recipe name"
            return
        }

        do {
            let realm = try Realm()
            let recipe = Recipe()

            try realm.write {
                recipe.name = name
                recipe.ingredients.append(objectsIn: selectedIngredients)

                realm.add(recipe)
            }
            if let router = self.router {
                router.pop()
            }
        } catch {
            errorMessage =
                "Error during save recipe: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func update() {}

    func getRecipeById(_ _id: ObjectId) {
        do {
            let realm = try Realm()

            guard
                let recipe = realm.object(
                    ofType: Recipe.self,
                    forPrimaryKey: _id
                )
            else {
                errorMessage = "Recipe not found with recipe id: \(_id)"
                return
            }

            name = recipe.name
        } catch {
            errorMessage =
                "Error during fetch recipe by id with erorr: \(error.localizedDescription)"
        }
    }
}
