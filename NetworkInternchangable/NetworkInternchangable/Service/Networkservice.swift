//
//  Networkservice.swift
//  NetworkInternchangable
//
//  Created by Melik Demiray on 5.01.2024.
//

import Foundation



protocol Networkservice {

    func downloadData(_ resource: String) async throws -> [User]
    var type: String { get set }
}
