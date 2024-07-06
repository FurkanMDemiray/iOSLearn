//
//  UserViewModel.swift
//  ProtocolOriented
//
//  Created by Melik Demiray on 23.01.2024.
//

import Foundation



class UserViewModel {

    let userService: UserService
    weak var output: UserViewModelProcotol?

    init(userService: UserService) {
        self.userService = userService
    }


    func fetchUser() {
        userService.fetchUser { result in
            switch result {
            case .success(let user):
                self.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure(_):
                self.output?.updateView(name: "Error", email: "Error", userName: "Error")
            }
        }
    }


}
