//
//  AramalarVC.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 10.04.2024.
//

import UIKit

class CallsVC: UIViewController {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bip")
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "Yeni BiP Araması"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var statusStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, label, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notification"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let callsBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ballot"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let phoneButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "viber"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Arama başlatmak için ekranınızın sağ altındaki telefon simgesine dokunun ya da tuş takımı ile yeni numara girin."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configureInfoLabel() {
        view.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: statusStackView.topAnchor, constant: view.frame.height / 2),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    private func configureStatusStackView() {
        view.addSubview(statusStackView)
        NSLayoutConstraint.activate([
            statusStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            statusStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            statusStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            ])
    }

    private func configureNotificationButton() {
        view.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    private func configureCallsButton() {
        view.addSubview(callsBtn)
        NSLayoutConstraint.activate([
            callsBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -110),
            callsBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    private func configurePhoneButton() {
        view.addSubview(phoneButton)
        NSLayoutConstraint.activate([
            phoneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            phoneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureStatusStackView()
        configureNotificationButton()
        configureCallsButton()
        configurePhoneButton()
        configureInfoLabel()
    }
}
