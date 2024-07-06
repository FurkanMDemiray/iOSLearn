//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit
import FirebaseFirestore

class ToDoListCell: UITableViewCell {


    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageCheck: UIImageView!

    // add gesture recognizer to the image
    override func awakeFromNib() {
        super.awakeFromNib()
        // set size of the image
        imageCheck.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }

    func setCell(with toDoModel: ToDo) {
        label.text = toDoModel.toDoText
        dateLabel.text = String(toDoModel.date?.description.prefix(10) ?? "")
        if toDoModel.isDone == "true" {
            imageCheck.image = UIImage(named: "check")
        } else if toDoModel.isDone == "false" {
            imageCheck.image = UIImage(named: "cross")
        }
        else {
            imageCheck.image = UIImage(named: "workInProgress")
        }
    }

    func changeImage(with toDoModel: ToDo) {
        // update isDone status

        let db = Firestore.firestore()

        // get isDone status from firestore
        db.collection("ToDoList").document(toDoModel.id!).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                print(dataDescription?["isDone"] as? String ?? "")
                var status = dataDescription?["isDone"] as? String

                if let id = toDoModel.id {
                    // if status = false change it to workInProgress
                    if toDoModel.isDone == "workInProgress" {
                        status = "true"
                        self.imageCheck.image = UIImage(named: "check")
                    }
                    else if toDoModel.isDone == "true" {
                        status = "false"
                        self.imageCheck.image = UIImage(named: "workInProgress")
                    }
                    else {
                        status = "workInProgress"
                        self.imageCheck.image = UIImage(named: "cross")
                    }
                    let toDoDict: [String: Any] = ["isDone": status ?? ""]
                    db.collection("ToDoList").document(id).updateData(toDoDict) { (error) in
                        if let error = error {
                            print("Error updating document: \(error)")
                        } else {
                            print("Document updated")
                        }
                    }
                }

            } else {
                print("Document does not exist")
            }

        }
    }

}
