//
//  User.swift
//  Protocol&Notification
//
//  Created by Melik Demiray on 27.03.2024.
//

import Foundation


struct User: Decodable {

    let name: String?
    let username: String?
    let email: String?
    let company: Company?

}


struct Company: Decodable {
    let name: String?
}

