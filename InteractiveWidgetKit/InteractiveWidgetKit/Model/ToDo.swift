//
//  ToDo.swift
//  InteractiveWidgetKit
//
//  Created by Melik Demiray on 9.01.2024.
//

import Foundation




struct ToDo : Identifiable{
    let id: String = UUID().uuidString
    var name: String
    var isDone: Bool = false
}


class SharedData {

    static let shared = SharedData()

    var toDos: [ToDo] = [
            .init(name: "Buy Milk"),
            .init(name: "Buy Eggs"),
            .init(name: "Buy Bread")
    ]

}
