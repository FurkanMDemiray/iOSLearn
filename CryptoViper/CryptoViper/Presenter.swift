//
//  Presenter.swift
//  CryptoViper
//
//  Created by Melik Demiray on 22.12.2023.
//

import Foundation

// presenter is the middleman between view and interactor
// talks to view and interactor and router

enum NetworkError: Error {
    case NetworkaFail
    case ParsingFail
}

protocol AnyPresenter {

    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }


    func interactorDidDownloadCryptoData(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {

    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptoData()
        }
    }
    var view: AnyView?
    var router: AnyRouter?

    func interactorDidDownloadCryptoData(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(_):
            view?.update(with: "Try again later...")
        }
    }
}
