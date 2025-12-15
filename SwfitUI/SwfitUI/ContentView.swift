//
//  ContentView.swift
//  SwfitUI
//
//  Created by DHEERAJ on 30/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0
    @State private var selectedColor: Color = .red

    var body: some View {
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                VStack {
                    List {
                        Section("Preview") {

                        }

                        Section("Properties") {
                            Slider(value: $progress)

                            Button("Toggle Actions") {

                            }
                            .buttonStyle(.glassProminent)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    VStack {
                        Text("Select Background Color")
                        Picker("Background Color", selection: $selectedColor) {
                            Text("Red").tag(Color.red)
                            Text("Green").tag(Color.green)
                            Text("Blue").tag(Color.blue)
                        }
                        .pickerStyle(.segmented)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(selectedColor)
                }

            }
            .badge(2)

            Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
            }

            Tab("Account", systemImage: "person.crop.circle.fill") {
            }
            .badge("!")
        }
    }
}

#Preview {
    ContentView()
}
