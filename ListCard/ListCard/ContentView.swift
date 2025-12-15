//
//  ContentView.swift
//  ListCard
//
//  Created by DHEERAJ on 15/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var list: [Color] = [.red, .green, .pink, .blue, .white]

    var body: some View {
        VStack {
            ForEach(list, id: \.self) { color in
                Button {
                    withAnimation(.spring()) {
                        if let index = list.firstIndex(of: color) {
                            list.remove(at: index)
                        }
                    }
                } label: {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .foregroundStyle(color)
                        .transition(
                            .move(edge: .leading).combined(with: .opacity)
                        )
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
