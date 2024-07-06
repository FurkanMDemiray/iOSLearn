//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by Melik Demiray on 8.01.2024.
//

import Foundation
import SwiftData


@Model
final class ToDo {
    var name: String
    var priority: Int

    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
