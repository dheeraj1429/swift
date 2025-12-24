//
//  RealmConfig.swift
//  LearningRealmDb
//
//  Created by DHEERAJ on 22/12/25.
//

import Foundation
import RealmSwift

extension Realm.Configuration {
    static var sharedConfig: Realm.Configuration {
        var config = Realm.Configuration()
        config.schemaVersion = 5
        return config
    }
}
