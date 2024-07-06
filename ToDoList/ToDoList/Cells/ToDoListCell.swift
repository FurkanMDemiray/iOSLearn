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
        if toDoModel.isDone ?? false {
            imageCheck.image = UIImage(named: "check")
        } else {
            imageCheck.image = UIImage(named: "cross")
        }
    }

    func changeImage(with toDoModel: ToDo) {
       // update isDone status

        let db = Firestore.firestore()
        if let id = toDoModel.id {
            db.collection("ToDoList").document(id).updateData(["isDone": !toDoModel.isDone!])
        }

        if imageCheck.image == UIImage(named: "check") {
            imageCheck.image = UIImage(named: "cross")
        } else {
            imageCheck.image = UIImage(named: "check")
        }
    }

}
