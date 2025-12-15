//
//  NavbarView.swift
//  YtClone
//
//  Created by DHEERAJ on 09/12/25.
//

import SwiftUI

enum ChipList: String, CaseIterable {
    case all = "All"
    case news = "News"
    case gaming = "Gaming"
    case music = "Music"
    case live = "Live"
    case cartoon = "Cartoon"
}

struct NavbarView: View {
    @EnvironmentObject private var rounter: Router

    @State var selectedChip: ChipList? = nil

    var body: some View {
        VStack(
            spacing: 10,
            content: {
                HStack(
                    spacing: 20,
                    content: {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 40)

                        Spacer()

                        Button {
                            rounter.push(.search)
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                        }
                        .buttonStyle(.plain)

                        AsyncImage(url: URL(string: Mock.userProfileUrl)) {
                            image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 38, height: 38)
                                .cornerRadius(50)
                        } placeholder: {
                            Circle()
                                .frame(width: 38, height: 38)
                                .foregroundStyle(Color.gray.opacity(0.3))
                        }
                    }
                )
                .padding(.horizontal, Constants.defaultSidePadding)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ChipView(isActive: .constant(false)) {
                            Image(systemName: "location")
                                .foregroundStyle(Color(.systemGray))
                        }
                        ForEach(ChipList.allCases, id: \.self) { chip in
                            ChipView(
                                isActive: Binding<Bool>(
                                    get: { selectedChip == chip },
                                    set: { _ in
                                        selectedChip = chip
                                    }
                                ),
                                label: chip.rawValue,
                            )
                        }
                    }
                }
                .contentMargins(.leading, 15)
                .frame(width: .infinity, height: 50)
            }
        )
    }
}

#Preview {
    NavbarView()
}
