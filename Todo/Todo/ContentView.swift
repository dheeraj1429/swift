//
//  ContentView.swift
//  Todo
//
//  Created by DHEERAJ on 16/12/25.
//

import CoreData
import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var forceRedraw
    @StateObject private var dataController = DataController()

    var body: some View {
        NavigationStack {
            VStack {
                TodoView()
            }
        }.environment(
            \.managedObjectContext,
            dataController.controller.viewContext
        )
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
