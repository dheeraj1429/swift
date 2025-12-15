//
//  Example5.swift
//  StateMagement
//
//  Created by DHEERAJ on 28/11/25.
//

import SwiftUI

class GlobalState: ObservableObject {
    @Published var isActive: Bool = false;
}

struct Example5: View {
    @EnvironmentObject var globalState: GlobalState;
    
    var body: some View {
        VStack {
            Text(globalState.isActive ? "Hello world!" : "Learning swift ui")
            Example5_1()
        }
    }
}
