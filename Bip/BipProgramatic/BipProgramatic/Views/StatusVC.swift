//
//  DurumVC.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 10.04.2024.
//

import UIKit

class StatusVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

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
        label.text = "Durum"
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

    lazy var bipStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, label, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureBipStackView() {
        view.addSubview(bipStackView)
        NSLayoutConstraint.activate([
            bipStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            bipStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bipStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            ])
    }

    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user-add")
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Durumum"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Durum güncelllemesi ekle"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [statusLabel, infoLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var myStatusStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personImageView, infoStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureMyStatusStackView() {
        view.addSubview(myStatusStackView)
        NSLayoutConstraint.activate([
            myStatusStackView.topAnchor.constraint(equalTo: bipStackView.bottomAnchor, constant: 32),
            myStatusStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            myStatusStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            myStatusStackView.heightAnchor.constraint(equalToConstant: 70)
            ])
    }

    let writeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "photo-camera"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func configureWriteButton() {
        view.addSubview(writeButton)
        NSLayoutConstraint.activate([
            writeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            writeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    let photoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func configurePhotoButton() {
        view.addSubview(photoButton)
        NSLayoutConstraint.activate([
            photoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -110),
            photoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureBipStackView()
        configureLabel()
        configureMyStatusStackView()
        configureWriteButton()
        configurePhotoButton()
    }
}
