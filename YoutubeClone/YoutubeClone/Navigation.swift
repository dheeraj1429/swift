//
//  Navigation.swift
//  YtClone
//
//  Created by DHEERAJ on 11/12/25.
//

import Combine
import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ screen: Screen) {
        path.append(screen)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
