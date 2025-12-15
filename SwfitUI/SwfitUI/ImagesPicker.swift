//
//  ImagesPicker.swift
//  SwfitUI
//
//  Created by DHEERAJ on 16/12/25.
//

import PhotosUI
import SwiftUI

struct ImagesPicker: View {
    @State var selectedItems = [PhotosPickerItem]()
    @State var selectedImages = [Image]()

    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0..<selectedImages.count, id: \.self) { index in
                            selectedImages[index]
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                        }
                    }
                }.toolbar {
                    PhotosPicker(
                        "Select images",
                        selection: $selectedItems,
                        matching: .images
                    )
                }
                .onChange(of: selectedItems) { _, newValue in
                    Task {
                        selectedImages.removeAll()

                        do {
                            for item in newValue {
                                if let image = try await item.loadTransferable(
                                    type: Image.self
                                ) {
                                    selectedImages.append(image)
                                }
                            }
                        } catch {
                            print("ERROR: \(error)")
                        }

                    }
                }
            }
        }
    }
}

#Preview {
    ImagesPicker()
}
