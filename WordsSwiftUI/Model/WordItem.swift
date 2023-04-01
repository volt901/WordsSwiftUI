//
//  WordItem.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 01.04.2023.
//

import Foundation
import RealmSwift

class WordItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var mainWord: String = ""
    @Persisted var wordTranslate: String = ""
    @Persisted var wordDescription: String = ""
    
    @Persisted var weigh: Int = 0
    
    override class func primaryKey() -> String? {
        "id"
    }
}
