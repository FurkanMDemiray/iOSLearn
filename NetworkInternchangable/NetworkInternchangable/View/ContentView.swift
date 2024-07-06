//
//  ContentView.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import SwiftUI

struct ContentView: View {


    @ObservedObject var userListViewModel: UserListViewModel

    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }

    var body: some View {
        List(userListViewModel.users, id: \.id) { user in
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.title2)

                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.green)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }

        }.task {
            do {
                try await userListViewModel.fetchUsers()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
