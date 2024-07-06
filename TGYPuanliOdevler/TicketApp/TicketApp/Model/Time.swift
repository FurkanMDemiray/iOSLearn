//
//  Time.swift
//  TicketApp
//
//  Created by Melik Demiray on 20.04.2024.
//

import Foundation

class Time {
    var hour: String
    var minute: String

    init(hour: String = "0", minute: String = "0") {
        self.hour = hour
        self.minute = minute
    }

    func printTime() {
        print("Time: \(self.hour):\(self.minute)")
    }
}
