//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by Melik Demiray on 8.01.2024.
//

import SwiftUI

struct ToDoListView: View {

    @Environment(\.modelContext) var context
    let toDos: [ToDo]

    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Text("\(toDo.priority)")
                    }
                }
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let toDo = toDos[index]
                    context.delete(toDo)
                    do {
                        try context.save()
                    } catch {
                        print(error)
                    }
                }
            })
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDetailScreen(toDo: toDo)
        }
    }
}
/*
#Preview {
    ToDoListView(toDos: [ToDo(name: "Test", priority: 1)]).modelContainer(for: [ToDo.self])
}

*/
