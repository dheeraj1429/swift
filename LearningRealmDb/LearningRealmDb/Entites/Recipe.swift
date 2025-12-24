//
//  Recipe.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 22/12/25.
//

import Foundation
import RealmSwift

class Recipe: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String

    @Persisted var ingredients: List<Ingredient>

    @Persisted var createdAt: Date = .now
    @Persisted var updatedAt: Date = .now
}
