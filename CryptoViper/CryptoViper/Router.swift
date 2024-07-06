//
//  Router.swift
//  CryptoViper
//
//  Created by Melik Demiray on 22.12.2023.
//

import Foundation
import UIKit


// Entry Point
// Router is the entry point of the VIPER architecture. It is responsible for creating the module and navigating between modules.
// talks to presenter

typealias Entrypoint = UIViewController & AnyView

protocol AnyRouter {

    var entry: Entrypoint? { get set }
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    var entry: Entrypoint?
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? Entrypoint
        
        return router
    }
}
