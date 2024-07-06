//
//  ViewController.swift
//  CryptoCrazyRxMvvm
//
//  Created by Melik Demiray on 13.12.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let crytopVm = CryptoViewModel()
    var cryptoList = [Crypto]()
    var disposeBag = DisposeBag()

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.delegate = self
        tableView.dataSource = self

        setupBindings()
        crytopVm.requestData()
    }

    private func setupBindings() {

        crytopVm.loading
            .bind(to: indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)

        crytopVm.error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { (error) in
            print(error)
        }.disposed(by: disposeBag)

        crytopVm.cryptoList
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { (cryptoList) in
            self.cryptoList = cryptoList
            self.tableView.reloadData()
        }.disposed(by: disposeBag)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }

}

