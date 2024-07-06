//
//  Webservice.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}


class Webservice: Networkservice {
    var type = "Web"

    func downloadData(_ resource: String) async throws -> [User] {

        guard let url = URL(string: resource) else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw NetworkError.noData
        }

        guard let users = try? JSONDecoder().decode([User].self, from: data) else {
            throw NetworkError.decodingError
        }
        return users

    }


}
