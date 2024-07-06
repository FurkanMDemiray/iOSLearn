//
//  DahaFazlaVC.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 10.04.2024.
//

import UIKit

class MoreVC: UIViewController {

    let settings = [
        "Kanallar", "Oyunlar", "Dijital Varlık", "Paycell", "Kişi Listesi", "Tuş Takımı", "Kamera", "Acild Durum", "Yıldızlı Mesajlar"
    ]

    let subSettings = [
        "BiP Web", "Davet Et", "Ayarlar"
    ]

    let screenHeight = UIScreen.main.bounds.size.height

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bip")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "Daha Fazla"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configureLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            label.widthAnchor.constraint(equalToConstant: 200)
            ])
    }

    private func configureImageView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Furkan Melik Demiray"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var personStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personImageView, nameLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configurePersonStackView() {
        view.addSubview(personStackView)
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            personStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            personStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
            ])
    }

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MoreCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = screenHeight < 750 ? 35 : 45
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
            ])
    }

    let subTableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubMoreCell.self, forCellReuseIdentifier: "cellAlt")
        return tableView
    }()

    private func configureSubTableView() {
        view.addSubview(subTableView)
        subTableView.delegate = self
        subTableView.dataSource = self
        subTableView.rowHeight = screenHeight < 750 ? 35 : 45
        NSLayoutConstraint.activate([
            subTableView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 16),
            subTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            subTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8),
            subTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            subTableView.heightAnchor.constraint(equalToConstant: 150)
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureImageView()
        configureLabel()
        configurePersonStackView()
        configureTableView()
        configureSubTableView()
    }
}

extension MoreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView { return settings.count }
        else if tableView == self.subTableView { return subSettings.count }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoreCell
            cell.configure(with: settings[indexPath.row])
            return cell
        }
        else if tableView == subTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellAlt", for: indexPath) as! SubMoreCell
            cell.configure(with: subSettings[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
