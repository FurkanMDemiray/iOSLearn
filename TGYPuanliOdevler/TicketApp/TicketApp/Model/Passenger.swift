//
//  Passenger.swift
//  TicketApp
//
//  Created by Melik Demiray on 20.04.2024.
//

import Foundation

class Passenger {
    var name: String
    var surname: String
    var id: Int

    init(name: String = "nameless", surname: String = "nameless", id: Int = 0) {
        self.name = name
        self.surname = surname
        self.id = id
    }

    func printPassenger() {
        print("Name: \(self.name) - Surname:\(self.surname) - Id: \(self.id)")
    }
}
