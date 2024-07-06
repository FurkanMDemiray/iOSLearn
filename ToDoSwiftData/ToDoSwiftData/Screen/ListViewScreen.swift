//
//  ListViewScreen.swift
//  ToDoSwiftData
//
//  Created by Melik Demiray on 8.01.2024.
//

import SwiftUI
import SwiftData

struct ListViewScreen: View {

    @Query(sort: \ToDo.name, order: .forward) var toDos: [ToDo]
    @State var isPresented: Bool = false

    var body: some View {
        NavigationStack {
            ToDoListView(toDos: toDos)
                .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isPresented = true
                    }, label: {
                            Text("Add")
                        }).sheet(isPresented: $isPresented, content: {
                        AddToDoScreen()
                    })
                }
            }
        }
    }
}

#Preview {
    ListViewScreen().modelContainer(for: [ToDo.self])
}
