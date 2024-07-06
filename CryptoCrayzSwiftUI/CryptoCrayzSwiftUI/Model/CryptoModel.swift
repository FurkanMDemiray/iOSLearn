//
//  CryptoModel.swift
//  CryptoCrayzSwiftUI
//
//  Created by Melik Demiray on 30.12.2023.
//

import Foundation


struct Crypto: Hashable,Decodable, Identifiable {

    var id = UUID()
    var price: String
    var currency: String

    private enum CodingKeys: String, CodingKey {
        case price = "price"
        case currency = "currency"
    }
}
