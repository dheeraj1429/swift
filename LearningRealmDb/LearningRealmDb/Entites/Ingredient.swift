//
//  Ingredient.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import Foundation
import RealmSwift

class Ingredient: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var isDeleted: Bool = false
    @Persisted var isActive: Bool = true
    @Persisted var type: String? = nil

    @Persisted(originProperty: "ingredients") var recipe: LinkingObjects<Recipe>

    @Persisted var createdAt: Date = .now
    @Persisted var updatedAt: Date = .now
}
