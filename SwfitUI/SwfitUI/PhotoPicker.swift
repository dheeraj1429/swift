import PhotosUI
import SwiftUI

struct PhotoPickerView: View {
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImage: Image? = nil

    var body: some View {
        VStack(
            spacing: 20,
            content: {
                if let selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ContentUnavailableView(
                        "No Photo",
                        systemImage: "photo.badge.plus",
                        description: Text("Tap the button to pick a photo")
                    )
                }

                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Select a Photo", systemImage: "photo.on.rectangle")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        )
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try await newItem?.loadTransferable(
                    type: Data.self
                ) {
                    if let uiImage = UIImage(data: data) {
                        selectedImage = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView()
}
