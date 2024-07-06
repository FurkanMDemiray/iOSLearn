//
//  KeşfetVC.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 10.04.2024.
//

import UIKit

class DiscoverVC: UIViewController {

    let categories = ["Eğlence", "Bilgi", "İş ve Yaşam", "Spor", "Diğer", "Sohbet"]

    let adsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AdsCell.self, forCellWithReuseIdentifier: "reklamCell")
        return collectionView
    }()

    private func configureAdsCollectionView() {
        containerStackView.addArrangedSubview(adsCollectionView)
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        adsCollectionView.backgroundColor = .white
        adsCollectionView.showsHorizontalScrollIndicator = false
        NSLayoutConstraint.activate([
            adsCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            adsCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8),
            adsCollectionView.heightAnchor.constraint(equalTo: adsCollectionView.widthAnchor, multiplier: 0.5),
            adsCollectionView.widthAnchor.constraint(equalTo: adsCollectionView.widthAnchor, multiplier: 0.6)
            ])
    }

    let populerLabel: UILabel = {
        let label = UILabel()
        label.text = "Popüler"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configurePopulerLabel() {
        containerStackView.addArrangedSubview(populerLabel)
        NSLayoutConstraint.activate([
            populerLabel.topAnchor.constraint(equalTo: adsCollectionView.bottomAnchor, constant: 16),
            populerLabel.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            populerLabel.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8)
            ])
    }

    let populerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PopulerCell.self, forCellWithReuseIdentifier: "populerCell")
        return collectionView
    }()

    private func configurePopulerCollectionView() {
        containerStackView.addArrangedSubview(populerCollectionView)
        populerCollectionView.delegate = self
        populerCollectionView.dataSource = self
        populerCollectionView.backgroundColor = .white
        populerCollectionView.showsHorizontalScrollIndicator = false
        NSLayoutConstraint.activate([
            populerCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            populerCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8),
            populerCollectionView.heightAnchor.constraint(equalTo: populerCollectionView.widthAnchor, multiplier: 0.6)
            ])
    }

    let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Kategoriler"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configureCategoriesLabel() {
        containerStackView.addArrangedSubview(categoriesLabel)
        NSLayoutConstraint.activate([
            categoriesLabel.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            categoriesLabel.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8),
            ])
    }

    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "kategoriCell")
        return collectionView
    }()

    private func configureCategoriesCollectionView() {
        containerStackView.addArrangedSubview(categoriesCollectionView)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.backgroundColor = .white
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        NSLayoutConstraint.activate([
            categoriesCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8),
            categoriesCollectionView.heightAnchor.constraint(equalTo: categoriesCollectionView.widthAnchor, multiplier: 0.2)
            ])
    }

    lazy var subCategoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(SubCategoryCell.self, forCellWithReuseIdentifier: "kategorilerAltCell")
        return collectionView
    }()

    private func configureSubCategoriesCollectionView() {
        containerStackView.addArrangedSubview(subCategoriesCollectionView)
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        subCategoriesCollectionView.showsVerticalScrollIndicator = false
        NSLayoutConstraint.activate([
            subCategoriesCollectionView.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor, constant: 8),
            subCategoriesCollectionView.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor, constant: -8),
            subCategoriesCollectionView.bottomAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: -8)
            ])
    }

    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureContainerStackView() {
        view.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureContainerStackView()
        configureAdsCollectionView()
        configurePopulerLabel()
        configurePopulerCollectionView()
        configureCategoriesLabel()
        configureCategoriesCollectionView()
        configureSubCategoriesCollectionView()
    }
}

extension DiscoverVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == adsCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        else if collectionView == populerCollectionView {
            return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height / 1.3)
        }
        else if collectionView == categoriesCollectionView {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height / 2)
        }
        else if collectionView == subCategoriesCollectionView {
            return CGSize(width: collectionView.frame.width, height: 100)
        }
        return CGSize(width: 0, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == adsCollectionView {
            return 3
        }
        else if collectionView == categoriesCollectionView {
            return categories.count
        }
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == adsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reklamCell", for: indexPath) as! AdsCell
            if let adsImage = UIImage(named: "reklam") {
                cell.configure(with: adsImage)
            }
            return cell
        }
        else if collectionView == populerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "populerCell", for: indexPath) as! PopulerCell
            if let populerImage = UIImage(named: "easycep") {
                cell.configure(with: populerImage)
            }
            return cell
        }
        else if collectionView == categoriesCollectionView {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kategoriCell", for: indexPath) as! CategoryCell
            cell.configure(with: categories[indexPath.row])
            return cell
        }
        else if collectionView == subCategoriesCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kategorilerAltCell", for: indexPath) as! SubCategoryCell
            return cell
        }
        return UICollectionViewCell()
    }
}
