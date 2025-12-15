//
//  SwfitUIApp.swift
//  SwfitUI
//
//  Created by DHEERAJ on 30/11/25.
//

import CoreData
import SwiftUI

@main
struct SwfitUIApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            CoreDataExample()
                .environment(
                    \.managedObjectContext,
                    dataController.controller.viewContext
                )
        }
    }
}
