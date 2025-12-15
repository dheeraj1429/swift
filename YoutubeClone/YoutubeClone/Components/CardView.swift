//
//  CardView.swift
//  YtClone
//
//  Created by DHEERAJ on 10/12/25.
//

import SwiftUI

struct CardView<
    TitleModifier: ViewModifier,
    SubtitleModifier: ViewModifier,
    ContentView: View
>: View {
    let posterUrl: String
    let titleModifier: TitleModifier
    let subtitleModifier: SubtitleModifier

    let title: String?
    let subTitle: String?
    var action: (() -> Void)? = nil
    var content: ContentView

    init(
        posterUrl: String,
        title: String? = nil,
        subTitle: String? = nil,
        titleModifier: TitleModifier = EmptyModifier(),
        subtitleModifier: SubtitleModifier = EmptyModifier(),
        action: (() -> Void)? = nil,
        @ViewBuilder content: () -> ContentView = { EmptyView() }
    ) {
        self.posterUrl = posterUrl
        self.title = title
        self.subTitle = subTitle
        self.titleModifier = titleModifier
        self.subtitleModifier = subtitleModifier
        self.action = action
        self.content = content()
    }

    var body: some View {
        VStack(
            alignment: .leading,
            content: {
                Button {
                    if let action {
                        action()
                    }
                } label: {
                    ZStack(
                        alignment: .bottomTrailing,
                        content: {
                            AsyncImage(
                                url: URL(
                                    string: Constants.posterBaseUrl + posterUrl
                                )
                            ) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: 220)
                                    .clipped()
                            } placeholder: {
                                Rectangle()
                                    .frame(width: .infinity, height: 220)
                                    .foregroundStyle(.gray)
                                    .opacity(0.3)
                            }
                        }
                    )
                }

                if !(content is EmptyView) {
                    content
                } else {
                    VStack(
                        alignment: .leading,
                        spacing: 5,
                        content: {
                            if let title {
                                Text(title)
                                    .modifier(titleModifier)
                                    .font(.subheadline)
                            }

                            if let subTitle {
                                Text(subTitle)
                                    .modifier(subtitleModifier)
                                    .font(.caption)
                                    .fontWeight(.thin)
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                }
            }
        )
    }
}

// Use this identity view modifier for defaults
struct AnyViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct RedTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.red)
    }
}

struct LargeSubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

#Preview {
    CardView(
        posterUrl: Mock.posterUrl,
        title: Mock.title,
        subTitle: Mock.subtitle,
    )
}
