//
//  DataController.swift
//  SwfitUI
//
//  Created by DHEERAJ on 16/12/25.
//

import Combine
import CoreData
import Foundation

class DataController: ObservableObject {
    let controller = NSPersistentContainer(name: "CoreDataModel")

    init() {
        controller.loadPersistentStores { description, error in
            if let error = error {
                print("Core data faild to load with error \(error)")
            }
        }
    }
}
