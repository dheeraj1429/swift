//
//  Example2.swift
//  StateMagement
//
//  Created by DHEERAJ on 27/11/25.
//

import SwiftUI

struct Example2: View {
    @State var isActive: Bool = false;
    
    var body: some View {
        Text(isActive ? "Hello, World!" : "Let's learing swift ui")
        ButtonView(isActive: $isActive)
    }
}

struct ButtonView: View {
    @Binding var isActive: Bool;
    
    var body: some View {
        Button {
            isActive.toggle()
        }label: {
            Text("Toggle")
        }
        .buttonStyle(
            .bordered
        )
    }
}

#Preview {
    Example2()
}
