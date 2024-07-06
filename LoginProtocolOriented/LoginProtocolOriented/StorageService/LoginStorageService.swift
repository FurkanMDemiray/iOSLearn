//
//  LoginStorageService.swift
//  LoginProtocolOriented
//
//  Created by Melik Demiray on 2.02.2024.
//

import Foundation


protocol LoginStorageService {
    
    var userAccessToken: String { get }
    func setUserAccessToken(token : String)
    func getUserAccessToken() -> String?
    
}
