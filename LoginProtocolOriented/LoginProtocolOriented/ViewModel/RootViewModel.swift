//
//  RootViewModel.swift
//  LoginProtocolOriented
//
//  Created by Melik Demiray on 2.02.2024.
//

import Foundation

class RootViewModel{
    
    weak var output: RootViewModelOutput?
    
    private let loginStorageService: LoginStorageService
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {

        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            //showMainView()
            output?.showMainView()
        }
        else {
            //showLoginView()
            output?.showLoginView()
        }

    }
}
