//
//  LinkItem.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 02.04.2023.
//

import Foundation
import RealmSwift

class LinkModel : Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var linkName: String = ""
    @Persisted var link: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
