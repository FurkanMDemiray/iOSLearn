//
//  ViewController.swift
//  ProtocolOriented
//
//  Created by Melik Demiray on 22.01.2024.
//

import UIKit

class UserViewController: UIViewController, UserViewModelProcotol {


    func updateView(name: String, email: String, userName: String) {
        nameLabel.text = name
        emailLabel.text = email
        userLabel.text = userName
    }

    let userViewModel: UserViewModel

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let userLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
        self.userViewModel.output = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        userViewModel.fetchUser()

        // Do any additional setup after loading the view.
    }

    func setupViews() {
        view.backgroundColor = .yellow
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(userLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),

            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.widthAnchor.constraint(equalToConstant: 100),
            emailLabel.heightAnchor.constraint(equalToConstant: 50),

            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            userLabel.widthAnchor.constraint(equalToConstant: 100),
            userLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    /*
    func fetchUser() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
                self.userLabel.text = user.username
            case .failure:
                self.nameLabel.text = "Error"
            }
        }
    }
*/
}

