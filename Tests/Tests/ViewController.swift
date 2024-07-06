//
//  ViewController.swift
//  Tests
//
//  Created by Melik Demiray on 10.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!

    var toDoList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add ToDo", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { textfield in
            textfield.placeholder = "Enter ToDo"
        }
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            guard let textfield = alert.textFields?.first, let inputText = textfield.text, !inputText.isEmpty else { return }
            self.toDoList.insert(inputText, at: 0)
            self.tableView.reloadData()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

}

