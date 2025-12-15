//
//  SearchListItem.swift
//  YoutubeClone
//
//  Created by DHEERAJ on 14/12/25.
//

import SwiftUI

struct SearchListItem: View {
    let title: String
    
    var body: some View {
        HStack(
            spacing: 12,
            content: {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
            }
        )
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
    }
}

#Preview {
    SearchListItem(title: Mock.title)
}
