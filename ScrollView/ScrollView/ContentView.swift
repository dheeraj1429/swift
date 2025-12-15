//
//  ContentView.swift
//  ScrollView
//
//  Created by DHEERAJ on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
//                        .frame(width: 100, height: 100)
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 19)
                        .foregroundStyle(Color(item.color))
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.paging)
    }
}

struct Item: Identifiable, Hashable {
    let id: UUID = UUID();
    let color: Color;
}

struct MockData {
    static var items: [Item] = [
        .init(color: .pink),
        .init(color: .green),
        .init(color: .red),
        .init(color: .blue),
        .init(color: .purple),
        .init(color: .red),
        .init(color: .purple),
        .init(color: .primary),
        .init(color: .black)
    ]
}

#Preview {
    ContentView()
}
