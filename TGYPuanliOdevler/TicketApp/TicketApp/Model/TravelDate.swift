//
//  Date.swift
//  TicketApp
//
//  Created by Melik Demiray on 20.04.2024.
//

import Foundation

class TravelDate {
    var day: Int
    var month: Int
    var year: Int
    var stringDate: String?
    var date: String {
        return "\(day)/\(month)/\(year)"
    }

    init(day: Int = 1, month: Int = 1, year: Int = 2024) {
        self.day = day
        self.month = month
        self.year = year
    }

    func printDate() {
        print("Date: \(self.day)/\(self.month)/\(self.year)")
    }
}
