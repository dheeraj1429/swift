//
//  ZStackView.swift
//  SwfitUI
//
//  Created by DHEERAJ on 01/12/25.
//

import SwiftUI

struct ZStackView: View {
    private let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        ZStack {
            ForEach(Array(colors.indices), id: \.self) { index in
                Rectangle()
                    .fill(colors[index])
                    .frame(width: 100, height: 100)
                    .offset(x: CGFloat(index) * 10.00, y: CGFloat(index) * 10.00)
            }
        }
    }
}

#Preview {
    ZStackView()
}
