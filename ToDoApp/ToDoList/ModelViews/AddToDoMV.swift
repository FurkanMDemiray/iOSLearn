//
//  AddToDoMV.swift
//  ToDoList
//
//  Created by Melik Demiray on 15.04.2024.
//

import Foundation
import FirebaseFirestore


class AddToDoMV {

    func addNewToDo(with toDo: ToDo) {
        // add to dolist on firestore
        let db = Firestore.firestore()
        let docRef = db.collection("ToDoList").document()
        let id = UUID().uuidString

        let toDoDict: [String: Any] = ["toDoText": toDo.toDoText ?? "", "date": toDo.date ?? "", "isDone": toDo.isDone ?? false, "id": id]

        docRef.setData(toDoDict) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(docRef.documentID)")
            }
        }

    }

}
