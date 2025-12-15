//
//  Example4.swift
//  StateMagement
//
//  Created by DHEERAJ on 27/11/25.
//

import SwiftUI

class Stuff: ObservableObject {
    @Published var text = "No Updated";
    @Published var buttonText = "Update";
    @Published var counter = 0;
    
    func changeText() {
        Task {
            sleep(3);
            
            DispatchQueue.main.async {
                self.text = "Text changed";
                self.buttonText = "Reset";
            }
        }
    }
}

struct Example4: View {
    @StateObject var stuff = Stuff();
    
    var body: some View {
        VStack(spacing: 30, content: {
            Text("\(stuff.text)")
            
            Button {
                stuff.changeText()
            }label: {
                Text("\(stuff.buttonText)")
            }
            
            Button {
                stuff.counter += 1;
            }label: {
                Text("\(stuff.counter)")
            }
            .buttonStyle(
                .bordered
            )
            
            AnotherScreenOrComponent(stuff: stuff)
        })
    }
}

struct AnotherScreenOrComponent: View {
    @ObservedObject var stuff: Stuff;
    
    var body: some View {
        VStack {
            Text("Hello world! \(stuff.counter)")
        }
    }
}

#Preview {
    Example4()
}
