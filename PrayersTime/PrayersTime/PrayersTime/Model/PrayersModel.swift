//
//  PrayersModel.swift
//  PrayersTime
//
//  Created by Melik Demiray on 12.05.2024.
//

import Foundation

// MARK: - Welcome
struct PrayersModel: Decodable {
    let success: Bool?
    let result: [Results]?
}

// MARK: - Result
struct Results: Decodable {
    let saat, vakit: String?
}
