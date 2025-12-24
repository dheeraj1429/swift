//
//  CardLabelViewModifier.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 24/12/25.
//

import Foundation
import SwiftUI

struct cardLabelViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(Color(.systemGray))
    }
}
