//
//  IngredientsView.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import RealmSwift
import SwiftUI

struct IngredientsView: View {
    @EnvironmentObject var router: Router
    @ObservedResults(Ingredient.self) var ingredients: Results<Ingredient>

    let gridColumns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(ingredients) { ingredient in
                        Button {
                            router.push(
                                .ingredientAction(
                                    params: IngredientActionParams(
                                        _id: ingredient._id,
                                        isEditMode: true
                                    )
                                )
                            )
                        } label: {
                            IngredientCardView(
                                name: ingredient.name,
                                isActive: ingredient.isActive,
                                createdAt: ingredient.createdAt
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
                router.push(
                    .ingredientAction(
                        params: IngredientActionParams(
                            _id: nil,
                            isEditMode: false
                        )
                    )
                )
            } label: {
                Text("Add ingredient")
            }
        }
    }
}

#Preview {
    IngredientsView()
        .environment(\.realmConfiguration, Realm.Configuration.sharedConfig)
}
