//
//  CryptoViewModel.swift
//  CryptoCrazyRxMvvm
//
//  Created by Melik Demiray on 13.12.2023.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {

    let cryptoList: PublishSubject<[Crypto]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    let loading: PublishSubject<Bool> = PublishSubject()

    func requestData() {
        self.loading.onNext(true)
        if let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") {
            Webservice().downloadCurrcies(url: url) { result in
                self.loading.onNext(false)
                switch result {
                case .success(let cryptoList):
                    self.cryptoList.onNext(cryptoList)
                    //print(cryptoList)
                case .failure(let error):
                    switch error {
                    case .serverError:
                        self.error.onNext("Server Error")
                    case .parsingError:
                        self.error.onNext("Parsing Error")
                    }
                }
            }
        }

    }

}

