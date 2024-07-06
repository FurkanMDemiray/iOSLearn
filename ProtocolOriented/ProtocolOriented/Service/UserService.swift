//
//  UserService.swift
//  ProtocolOriented
//
//  Created by Melik Demiray on 23.01.2024.
//

import Foundation


protocol UserService{
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
