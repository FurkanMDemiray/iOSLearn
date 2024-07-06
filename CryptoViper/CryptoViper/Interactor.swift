//
//  Interactor.swift
//  CryptoViper
//
//  Created by Melik Demiray on 22.12.2023.
//

import Foundation

// interactor is the middleman between presenter and data
// talks to presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func downloadCryptoData()

}


class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func downloadCryptoData() {

        if let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") {

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data, error == nil {
                    do {

                        let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                        self?.presenter?.interactorDidDownloadCryptoData(result: .success(cryptos))
                    } catch {
                        // parsing error
                        self?.presenter?.interactorDidDownloadCryptoData(result: .failure(NetworkError.ParsingFail))
                    }
                } else {
                    // data error
                    self?.presenter?.interactorDidDownloadCryptoData(result: .failure(NetworkError.NetworkaFail))
                }
            }
            task.resume()
        } else {
            // error
            self.presenter?.interactorDidDownloadCryptoData(result: .failure(NetworkError.NetworkaFail))
        }


    }






}
