//
//  RecipeCardView.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 24/12/25.
//

import SwiftUI

struct RecipeCardView: View {
    let name: String
    let createdAt: Date
    var nameOfIngredients: [String] = []

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5,
            content: {
                HStack(
                    spacing: 5,
                    content: {
                        Text("Name:")
                            .modifier(cardLabelViewModifier())

                        Text(name)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                )

                HStack(spacing: 5) {
                    Text("Created:")
                        .modifier(cardLabelViewModifier())

                    Text(createdAt.formatted())
                        .font(.footnote)
                }
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text("Ingredients:")
                        .modifier(cardLabelViewModifier())
                    
                    ForEach(nameOfIngredients, id: \.self) { name in
                            Text(name)
                            .font(.footnote)
                    }
                })
                .padding(.top, 10)
                
            }
        )
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    RecipeCardView(name: "Demo recipe", createdAt: .now, nameOfIngredients: ["Demo ingredient first", "Demo ingredient second", "Demo ingredient third"])
}
