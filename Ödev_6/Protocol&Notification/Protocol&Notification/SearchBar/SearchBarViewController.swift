//
//  SearchBarViewController.swift
//  Protocol&Notification
//
//  Created by Melik Demiray on 27.03.2024.
//

import UIKit

class SearchBarViewController: UIViewController {


    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var emptyView: UIView!
    var users = [User]()

    var filteredUsers = [User]()

    var isFiltering: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        // Search bar içindeki UITextField nesnesini bulun
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            // UITextField'in sol tarafındaki temizleme düğmesine erişin
            if let clearButton = textField.value(forKey: "_clearButton") as? UIButton {
                // Temizleme düğmesinin görünürlüğünü ayarlayın
                clearButton.setImage(UIImage(named: "custom_clear_button_image"), for: .normal)
                // Temizleme düğmesine dokunulduğunda çağrılacak fonksiyonu belirleyin
                clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
            }
        }

        let urlString = "https://jsonplaceholder.typicode.com/users"

        guard let url = URL(string: urlString) else { return }

        guard let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: url)) else { return }

        self.users = users

        emptyView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        let messageLabel = UILabel()
        messageLabel.text = "Arama sonucu bulunamadı."
        messageLabel.textColor = .black
        messageLabel.sizeToFit()
        messageLabel.center = CGPoint(x: emptyView.bounds.size.width / 2, y: emptyView.bounds.size.height / 2)
        emptyView.addSubview(messageLabel)
        tableView.backgroundView = emptyView
        emptyView.isHidden = true

    }

}
extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        if isFiltering {
            cell.textLabel?.text = filteredUsers[indexPath.row].name
        } else {
            cell.textLabel?.text = users[indexPath.row].name
        }
        return cell
    }
}

extension SearchBarViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty || searchText == "" {
            emptyView.isHidden = false
        } else {
            isFiltering = true
            filteredUsers = users.filter({ user -> Bool in
                return user.name?.lowercased().contains(searchText.lowercased()) ?? false
            })
            tableView.reloadData()
            if filteredUsers.isEmpty {
                emptyView.isHidden = false
            } else {
                emptyView.isHidden = true
            }
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
        emptyView.isHidden = true
    }

    @objc func clearButtonTapped() {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
        emptyView.isHidden = true
    }
}
