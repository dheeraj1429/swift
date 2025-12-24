//
//  IngredientCardView.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 20/12/25.
//

import SwiftUI

struct IngredientCardView: View {
    let name: String
    let isActive: Bool
    let createdAt: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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

            HStack(
                spacing: 6,
                content: {
                    Text("Status:")
                        .modifier(cardLabelViewModifier())

                    Label(
                        isActive ? "Active" : "Inactive",
                        systemImage: isActive
                            ? "checkmark.circle.fill" : "xmark.circle.fill"
                    )
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        isActive
                            ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
                    )
                    .foregroundColor(isActive ? .green : .red)
                    .cornerRadius(8)
                }
            )

            HStack(
                spacing: 6,
                content: {
                    Text("Created:")
                        .modifier(cardLabelViewModifier())

                    Text(createdAt.formatted())
                        .font(.footnote)
                }
            )
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    IngredientCardView(name: "Testing", isActive: true, createdAt: .now)
}
