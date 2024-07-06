//
//  ViewController.swift
//  TableView
//
//  Created by Melik Demiray on 27.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var names = ["Furkan", "Melik", "Yasin", "Mehmet", "Ali", "Ayşe", "Fatma"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton

        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func addButtonTapped() {
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter new item"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] (_) in
            guard let textField = alert.textFields?.first, let text = textField.text else { return }
            self?.names.append(text)
            self?.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Are you sure?", message: "Do you want to delete this item?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [weak self] (_) in
            self?.names.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .fade)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

