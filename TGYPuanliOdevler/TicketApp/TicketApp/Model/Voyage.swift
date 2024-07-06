//
//  Voyages.swift
//  TicketApp
//
//  Created by Melik Demiray on 28.04.2024.
//

import Foundation


struct Voyage {
    var fee: String
    var time: String
    var seatStatus = [String: Bool]()
    var id: String
}
