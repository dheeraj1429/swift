//
//  Example5-1.swift
//  StateMagement
//
//  Created by DHEERAJ on 28/11/25.
//

import SwiftUI

struct Example5_1: View {
    @EnvironmentObject var globalState: GlobalState;
    
    var body: some View {
        Text(globalState.isActive ? "Hello world! C1" : "Learning swift ui C1")
        Button {
            globalState.isActive.toggle()
        }label: {
            Text("Toggle")
        }
        .buttonStyle(.bordered)
    }
}
