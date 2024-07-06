//
//  LoginStorageServiceImpl.swift
//  LoginProtocolOriented
//
//  Created by Melik Demiray on 2.02.2024.
//

import Foundation



class LoginStorageServiceImpl: LoginStorageService {
    
    private let storage = UserDefaults.standard
    
    var userAccessToken: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessToken)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessToken)
    }
    

}
