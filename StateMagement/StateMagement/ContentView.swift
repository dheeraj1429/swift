//
//  ContentView.swift
//  StateMagement
//
//  Created by DHEERAJ on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false;
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(isActive ? "Hello, world!" : "Let's learning swfitui")
            
            Button {
                isActive.toggle()
            }label: {
                Text("Toggle")
            }
            .buttonStyle(
                .bordered
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
