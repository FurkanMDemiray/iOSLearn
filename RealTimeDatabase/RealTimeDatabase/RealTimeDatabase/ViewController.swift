//
//  ViewController.swift
//  RealTimeDatabase
//
//  Created by Melik Demiray on 4.04.2024.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tableVİew: UITableView!
    var ref: DatabaseReference!

    var users = [User]() {
        didSet {
            tableVİew.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableVİew.delegate = self
        tableVİew.dataSource = self
        addButtonToNavigationBar()
        getKey()
    }
    private func addButtonToNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    @objc private func addButtonTapped() {

        let alert = UIAlertController(title: "Add User", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let name = alert.textFields?.first?.text else { return }
            let user = User(id: UUID().uuidString, name: name)
            self?.users.removeAll()
            self?.writeData(user: user)
            self?.getKey()
            self?.tableVİew.reloadData()
        }
        alert.addAction(submitAction)
        present(alert, animated: true)

    }

    private func writeData(user: User) {
        ref = Database.database().reference()

        ref.child("users").child(user.id).setValue(["name": user.name])
    }

    private func getKey() {
        ref = Database.database().reference()
        ref.child("users").observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let self else { return }
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                self.getUser(snap.key)
                print(snap.key)
            }
        }
    }
    private func getUser(_ key: String) {
        ref = Database.database().reference().child("users").child(key)
        ref.observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let self else { return }

            let dict = snapshot.value as? [String: Any] ?? ["": ""]
            let name = dict["name"] as? String ?? " "
            let user = User(id: key, name: name)
            self.users.append(user)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    // delete from database
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ref = Database.database().reference()
            ref.child("users").child(users[indexPath.row].id).removeValue()
            users.remove(at: indexPath.row)
        }
    }

}
