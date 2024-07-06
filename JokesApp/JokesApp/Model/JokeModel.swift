//
//  JokeModel.swift
//  JokesApp
//
//  Created by Melik Demiray on 1.01.2024.
//

import Foundation


struct JokeModel: Identifiable, Codable {
    let categories: [String]?
    let createdAt: String?
    let iconURL: String?
    let id, updatedAt: String?
    let url: String?
    let value: String?
}
