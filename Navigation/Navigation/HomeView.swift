//
//  HomeView.swift
//  Navigation
//
//  Created by DHEERAJ on 29/11/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        Text("Home Screen")
            .font(.largeTitle)

        Button("Go to Details") {
            router.navigate(to: .details(message: "Hello from Home!"))
        }
        .navigationTitle("Home")
    }
}
