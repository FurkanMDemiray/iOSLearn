//
//  CompleteToDoIntent.swift
//  InteractiveWidgetKit
//
//  Created by Melik Demiray on 9.01.2024.
//

import Foundation
import SwiftUI
import AppIntents


struct CompleteToDoIntent: AppIntent {

    static var title: LocalizedStringResource = "Complete To Do"

    @Parameter(title: "To DoID")
    var id: String

    init(id: String) {
        self.id = id
    }

    init() {

    }

    func perform() async throws -> some IntentResult {

        if let index = SharedData.shared.toDos.firstIndex(where: {
            $0.id == id
        }) {
            SharedData.shared.toDos[index].isDone.toggle()
        }


        return .result()
    }



}
