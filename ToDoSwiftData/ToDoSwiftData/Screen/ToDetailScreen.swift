//
//  ToDetailScreen.swift
//  ToDoSwiftData
//
//  Created by Melik Demiray on 8.01.2024.
//

import SwiftUI
import SwiftData

struct ToDetailScreen: View {

    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @State var name: String = ""
    @State var priority: Int?

    let toDo: ToDo

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
            Button("Update") {
                guard let priority = priority else { return }
                toDo.name = name
                toDo.priority = priority
                do {
                    try context.save()
                } catch {
                    print(error)
                }
                dismiss()
            }
        }.onAppear() {
            name = toDo.name
            priority = toDo.priority
        }
    }
}
/*
#Preview {
    ToDetailScreen(toDo: ToDo)
}
*/
