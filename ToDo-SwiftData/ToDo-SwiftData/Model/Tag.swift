//
//  Tag.swift
//  ToDo-SwiftData
//
//  Created by Apetrei Mirel on 30.10.23.
//
import Foundation
import SwiftData

@Model
final class Tag {
    var name: String

    var todos: [ToDo]?

    var color: RGBColor

    init(name: String, color: RGBColor) {
        self.name = name
        self.color = color
    }
}
