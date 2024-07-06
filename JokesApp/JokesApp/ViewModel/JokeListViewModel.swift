//
//  JokeViewModel.swift
//  JokesApp
//
//  Created by Melik Demiray on 1.01.2024.
//

import Foundation
import Alamofire

class JokeListViewModel: ObservableObject {

    @Published var jokes = [JokeModel]()

    init() {
        getJokes()
    }

    func getJokes() {

        self.jokes.removeAll()
        for _ in 0...10 {
            AF.request("https://api.chucknorris.io/jokes/random", method: .get).responseDecodable(of: JokeModel.self) { response in

                switch response.result {

                case .success(let data):

                    self.jokes.append(data)
                case .failure(let error):
                    print(error)
                }
            }
        }

    }
}

