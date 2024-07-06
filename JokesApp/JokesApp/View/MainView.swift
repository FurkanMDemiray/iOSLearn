//
//  ContentView.swift
//  JokesApp
//
//  Created by Melik Demiray on 1.01.2024.
//

import SwiftUI

struct MainView: View {


    @ObservedObject var jokeViewModel = JokeListViewModel()

    init() {
        self.jokeViewModel = JokeListViewModel()
    }
    var body: some View {
        NavigationView {
            List(jokeViewModel.jokes) { joke in

                if let value = joke.value {
                    Text(value)
                        .font(.title2)
                        .padding(1)
                }
            }.toolbar {
                Button(action: {
                    jokeViewModel.getJokes()
                }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
            }
                .navigationTitle("Chuck Noris Jokes")

        }

    }
}

#Preview {
    MainView()
}
