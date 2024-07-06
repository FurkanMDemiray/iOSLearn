//
//  AddToDoVC.swift
//  ToDoList
//
//  Created by Melik Demiray on 15.04.2024.
//

import UIKit

class AddToDoVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    var toDo = ToDo()

    var addToDoMV = AddToDoMV()

    override func viewDidLoad() {
        super.viewDidLoad()

        toDo.date = datePicker.date
    }


    @IBAction func datePickerClicked(_ sender: Any) {
        toDo.date = datePicker.date
    }
    @IBAction func backBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addBtnClicked(_ sender: Any) {
        toDo.toDoText = textField.text!
        addToDoMV.addNewToDo(with: toDo)
        dismiss(animated: true, completion: nil)
    }
}


