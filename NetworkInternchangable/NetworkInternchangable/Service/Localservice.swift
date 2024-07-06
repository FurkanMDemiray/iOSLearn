//
//  Localservice.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import Foundation





class Localservice: Networkservice {
    var type = "Local"

    func downloadData(_ resource: String) async throws -> [User] {

        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            throw NetworkError.badURL
        }

        let data = try Data(contentsOf: URL(filePath: path))

        return try JSONDecoder().decode([User].self, from: data)
    }

}
