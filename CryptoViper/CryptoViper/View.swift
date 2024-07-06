//
//  View.swift
//  CryptoViper
//
//  Created by Melik Demiray on 22.12.2023.
//

import Foundation
import UIKit

// view is the UI

// talk to presenter

protocol AnyView {

    var presenter: AnyPresenter? { get set }

    func update(with cryptos: [Crypto])
    func update(with error: String)

}

class CryptoViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {


    var presenter: AnyPresenter?
    var cryptos = [Crypto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(messageLabel)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)

    }

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table

    }()
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.isHidden = false
        return label
    }()

    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }

    func update(with error: String) {
        DispatchQueue.main.async {
            self.cryptos = []
            self.messageLabel.text = error
            self.messageLabel.isHidden = false
            self.tableView.isHidden = true
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cryptos[indexPath.row].currency
        content.secondaryText = cryptos[indexPath.row].price
        cell.contentConfiguration = content
        cell.backgroundColor = .systemTeal

        return cell
    }

}
