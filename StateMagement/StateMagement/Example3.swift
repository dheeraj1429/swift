//
//  Example3.swift
//  StateMagement
//
//  Created by DHEERAJ on 27/11/25.
//

import SwiftUI

struct Example3: View {
    @State var isActive: Bool = false;
    
    var body: some View {
            
        Heading(isActive: isActive)
        
        Button {
            isActive.toggle()
        }label: {
            Text("Toggle")
        }
    }
}

struct Heading: View {
    let isActive: Bool;
    
    var body: some View {
        Text(isActive ? "Hello, world!" : "Let's learing swift ui")
    }
}

#Preview {
    Example3()
}
