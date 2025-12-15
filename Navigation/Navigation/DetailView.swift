//
//  DetailView.swift
//  Navigation
//
//  Created by DHEERAJ on 29/11/25.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var router: Router
    let message: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Details Screen")
            Text(message)

            Button("Back") {
                router.pop()
            }

            Button("Go to Root") {
                router.popToRoot()
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}
