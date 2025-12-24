//
//  IngredientActionViewModel.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import Combine
import Foundation
import RealmSwift
import SwiftUI

enum AppError: LocalizedError {
    case initializationFailed

    var errorDescription: String? {
        switch self {
        case .initializationFailed:
            return "Fail to initialise the realm. Please try again."
        }
    }
}

class IngredientActionViewModel: ObservableObject {
    @Published var ingredientName: String = ""
    @Published var isActive: Bool = true
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isEditMode: Bool = false

    private(set) var router: Router? = nil

    var isShowingAlert: Binding<Bool> {
        Binding {
            self.errorMessage != nil
        } set: { newValue in
            if !newValue {
                self.errorMessage = nil
            }
        }
    }

    func setRouter(_ router: Router) {
        self.router = router
    }

    func setEditMode(_ editMode: Bool) {
        self.isEditMode = editMode
    }

    func save() {
        isLoading = true
        guard !ingredientName.isEmpty else {
            errorMessage = "The ingredient name is empty!"
            return
        }

        do {
            let realm = try Realm()

            let ingredient = Ingredient()
            ingredient.name = ingredientName
            ingredient.isActive = isActive

            try realm.write {
                realm.add(ingredient)
            }
            ingredientName = ""
            isActive = true
            if let router = self.router {
                router.pop()
            }
        } catch {
            errorMessage = error.localizedDescription
            print("Error saving to Realm: \(error.localizedDescription)")
        }
        isLoading = false
    }

    func update(_ _id: ObjectId) {
        do {
            let realm = try Realm()
            let ingredient = realm.object(
                ofType: Ingredient.self,
                forPrimaryKey: _id
            )
            if let ingredient = ingredient {
                try realm.write {
                    ingredient.name = ingredientName
                    ingredient.isActive = isActive
                    realm.add(ingredient, update: .modified)
                }
            }
        } catch {
            errorMessage = error.localizedDescription
            print("ERROR: during update: \(error.localizedDescription)")
        }
    }

    func getIngredientById(_id: ObjectId) {
        do {
            let realm = try Realm()
            let ingredient = realm.objects(Ingredient.self).filter(
                "_id == %@",
                _id
            ).first
            guard let ingredient = ingredient else { return }
            ingredientName = ingredient.name
            isActive = ingredient.isActive
        } catch {
            print(error)
        }
    }
}
