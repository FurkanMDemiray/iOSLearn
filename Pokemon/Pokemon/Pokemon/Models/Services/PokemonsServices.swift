//
//  PokemonsServices.swift
//  Pokemon
//
//  Created by Melik Demiray on 4.04.2024.
//

import Foundation


enum CustomError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case error(String)
}

class PokemonsServices {

    static let shared = PokemonsServices()

    private init() { }

    func fetchPokemons(url: URL, completion: @escaping (Result<[Pokemon], CustomError>) -> ()) {

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.error(error!.localizedDescription)))
                return
            }

           if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    completion(.failure(.invalidResponse))
                    return
                }
            }
            do {
                let pokemons = try JSONDecoder().decode([Pokemon].self, from: data!)
                completion(.success(pokemons))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()

    }
}
