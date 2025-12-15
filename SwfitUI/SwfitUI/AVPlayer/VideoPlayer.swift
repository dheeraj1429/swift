//
//  VideoPlayer.swift
//  SwfitUI
//
//  Created by DHEERAJ on 02/12/25.
//

import SwiftUI

enum Query: String, CaseIterable {
    case nature, animal, people, ocean, food
}

struct VideoPlayer: View {
    @State private var selectedQuery: Query? = nil
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) { query in
                    Button {
                        selectedQuery = query
                    } label: {
                        VideoPlayerTag(label: query, isSelected: query == selectedQuery)
                    }
                }
            }
        }
    }
}

#Preview {
    VideoPlayer()
}
