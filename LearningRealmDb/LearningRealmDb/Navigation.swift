//
//  Navigation.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import Combine
import Foundation
import SwiftUI

enum Screen: Hashable {
    case home
    case ingredients
    case ingredientAction(params: IngredientActionParams)
    
    case recipes
    case recipeAction(params: RecipeActionViewParams)
}

class Router: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ screen: Screen) {
        path.append(screen)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
