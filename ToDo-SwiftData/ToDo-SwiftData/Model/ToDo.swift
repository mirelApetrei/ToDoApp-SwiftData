//
//  Item.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//

import Foundation
import SwiftData

@Model
final class ToDo {

    @Attribute(.unique)
    var creationDate: Date
    var name: String
    var isDone: Bool
    var priority: Int

    @Attribute(.externalStorage)
    var image: Data?

    var tags: [Tag]?


    init(timestamp: Date, name: String, isDone: Bool = false, priority: Int = 0) {
        self.creationDate = timestamp
        self.name = name
        self.isDone = isDone
        self.priority = priority
    }
}




