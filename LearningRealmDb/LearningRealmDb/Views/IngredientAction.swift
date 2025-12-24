//
//  IngredientAction.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import RealmSwift
import SwiftUI

struct IngredientActionParams: Hashable {
    let _id: ObjectId?
    var isEditMode: Bool = false
}

struct IngredientAction: View {
    let params: IngredientActionParams

    @EnvironmentObject var router: Router
    @StateObject private var ingredientActionViewModel =
        IngredientActionViewModel()

    var body: some View {
        VStack(
            spacing: 16,
            content: {
                TextField(
                    "Ingredient name",
                    text: $ingredientActionViewModel.ingredientName
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Toggle("Active", isOn: $ingredientActionViewModel.isActive)
                    .font(.subheadline)

                Spacer()
            }
        )
        .padding(.horizontal, 10)
        .toolbar {
            Button {
                if params.isEditMode {
                    if let ingredientId = params._id {
                        ingredientActionViewModel.update(ingredientId)
                    }

                } else {
                    ingredientActionViewModel.save()
                }

            } label: {
                Text(
                    params.isEditMode
                        ? "Edit ingredient" : "Save ingredient"
                )
            }
        }
        .onAppear {
            ingredientActionViewModel.setRouter(router)
            if let ingredientId = params._id {
                ingredientActionViewModel.getIngredientById(_id: ingredientId)
            }
            ingredientActionViewModel.setEditMode(params.isEditMode)
        }
        .alert(
            "Error",
            isPresented: ingredientActionViewModel.isShowingAlert,
            actions: {
                Button("OK", role: .cancel) {}
            },
            message: {
                Text(ingredientActionViewModel.errorMessage ?? "")
            }
        )
    }
}

#Preview {
    let router = Router()

    IngredientAction(
        params: IngredientActionParams(
            _id: try! ObjectId(string: "69494aaed2a8033989f7a833"),
            isEditMode: false
        )
    )
    .environmentObject(router)
}
