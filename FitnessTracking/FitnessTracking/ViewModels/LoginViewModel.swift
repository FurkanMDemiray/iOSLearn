//
//  LoginViewModel.swift
//  FitnessTracking
//
//  Created by Melik Demiray on 3.03.2024.
//

import Foundation


class LoginViewModel {

    private let userAuth = UserAuth()

    func signUp(email: String, password: String) {
        userAuth.signUp(email: email, password: password)
    }

    func logIn(email: String, password: String) {
        userAuth.logIn(email: email, password: password)
    }

}
