//
//  ChipView.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import SwiftUI

struct ChipView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isActive: Bool

    let label: String?
    let content: Content?

    init(
        isActive: Binding<Bool>,
        label: String? = nil
    ) where Content == EmptyView {
        self._isActive = isActive
        self.label = label
        self.content = nil
    }

    init(
        isActive: Binding<Bool>,
        label: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self._isActive = isActive
        self.label = label
        self.content = content()
    }

    var body: some View {
        let isDarkSceme = colorScheme == .dark

        Button {
            isActive.toggle()
        } label: {
            HStack {
                if let label {
                    Text(label)
                        .font(.system(size: 16))
                        .foregroundStyle(
                            !isDarkSceme && isActive
                                ? .white : Color(.systemGray)
                        )
                }

                if let content {
                    content
                }

            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Group {
                    if isActive {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("chipActiveColor"))
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.thinMaterial)
                    }
                }
            )
        }
    }
}

#Preview {
    VStack {
        ChipView(isActive: .constant(false), label: "News")
        ChipView(isActive: .constant(false)) {
            Image(systemName: "location")
        }
    }
}
