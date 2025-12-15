//
//  VideoPlayerTag.swift
//  SwfitUI
//
//  Created by DHEERAJ on 02/12/25.
//

import SwiftUI

struct VideoPlayerTag: View {
    var label: Query
    var isSelected: Bool = false
    
    var body: some View {
        Text(label.rawValue)
            .font(.caption)
            .bold()
            .foregroundStyle(isSelected ? .white : .gray)
            .padding(10)
            .background(.thinMaterial)
            .clipShape(.capsule)
    }
}

#Preview {
    VideoPlayerTag(label: Query.ocean, isSelected: false)
}
