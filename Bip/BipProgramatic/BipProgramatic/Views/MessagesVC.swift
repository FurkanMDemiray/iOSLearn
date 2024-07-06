//
//  MesajlarVC.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 10.04.2024.
//

import UIKit

class MessagesVC: UIViewController {

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
        label.text = "Mesajlar"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configureLabel() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: bipStackView.centerXAnchor)
            ])
    }

    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var bipStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, label, searchButton, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureBipStackView() {
        view.addSubview(bipStackView)
        NSLayoutConstraint.activate([
            bipStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            bipStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            bipStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            ])
    }

    let chatsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sohbetler", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let servicesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hizmetler", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var chatsServicesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chatsButton, servicesButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureChatsServicesStackView() {
        view.addSubview(chatsServicesStackView)
        NSLayoutConstraint.activate([
            chatsServicesStackView.topAnchor.constraint(equalTo: bipStackView.bottomAnchor, constant: 8),
            chatsServicesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            chatsServicesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            ])
    }

    let messageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let groupName: UILabel = {
        let label = UILabel()
        label.text = "GYGY 3.0 - Swift (2)"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Durun güncelllemesi ekle"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [groupName, messageLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var messageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [messageImage, infoStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureMessageStackView() {
        view.addSubview(messageStackView)
        NSLayoutConstraint.activate([
            messageStackView.topAnchor.constraint(equalTo: chatsServicesStackView.bottomAnchor, constant: 8),
            messageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            messageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            ])
    }

    let photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func configurePhotoButton() {
        view.addSubview(photoButton)
        NSLayoutConstraint.activate([
            photoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            photoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notification"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func configureNotificationButton() {
        view.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //<view.addSubview(photoButton)
        //view.addSubview(notificationButton)
        configureBipStackView()
        configureLabel()
        configureChatsServicesStackView()
        configureMessageStackView()
        configurePhotoButton()
        configureNotificationButton()

        /*NSLayoutConstraint.activate([
            messageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            photoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            photoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notificationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            //chatsLabel.widthAnchor.constraint(equalTo: chatsLabel.widthAnchor, constant: 30),
            //servicesLabel.widthAnchor.constraint(equalTo: servicesLabel.widthAnchor, constant: 30)

            ])*/
    }
}



