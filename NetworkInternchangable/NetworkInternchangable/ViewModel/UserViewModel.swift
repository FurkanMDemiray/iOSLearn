//
//  UserViewModel.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import Foundation




class UserListViewModel: ObservableObject {

    @Published var users = [UserViewModel]()

    //private let webservice = Webservice()
    private let service: Networkservice

    init(service: Networkservice) {
        self.service = service
    }

    func fetchUsers() async throws {

        if service.type == "Web" {
            let users = try await service.downloadData("https://jsonplaceholder.typicode.com/users")
            DispatchQueue.main.async {
                self.users = users.map(UserViewModel.init)
            }
        } else {
            let users = try await service.downloadData("users")
            DispatchQueue.main.async {
                self.users = users.map(UserViewModel.init)
            }
        }
    }

}




struct UserViewModel {

    let user: User

    var id: Int {
        user.id
    }

    var name: String {
        user.name
    }

    var email: String {
        user.email
    }

    var username: String {
        user.username
    }

}
