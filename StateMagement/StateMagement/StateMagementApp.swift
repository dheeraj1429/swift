//
//  StateMagementApp.swift
//  StateMagement
//
//  Created by DHEERAJ on 27/11/25.
//

import SwiftUI

@main
struct StateMagementApp: App {
    @StateObject var globalState = GlobalState()
    
    var body: some Scene {
        WindowGroup {
            Example5()
                .previewDevice("iPhone 16 pro")
                .environmentObject(globalState)
        }
    }
}
