//
//  Ticket.swift
//  TicketApp
//
//  Created by Melik Demiray on 20.04.2024.
//

import Foundation

class Ticket {
    var passenger: Passenger
    var date: TravelDate
    var time: Time
    var seat: [Int]
    var seats: [String]?
    var seatCount: Int
    var fromWhere: String
    var whereTo: String
    var fee: String
    var documentID: String?

    init(passenger: Passenger = Passenger(), date: TravelDate = TravelDate(), time: Time = Time(), seat: [Int] = [Int](), seatCount: Int = 0, fromWhere: String = "", whereTo: String = "", fee: String = "") {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seat = seat
        self.seatCount = seatCount
        self.fromWhere = ""
        self.whereTo = ""
        self.fee = ""
    }

    func compare(_ ticket: Ticket) -> Bool {
        for seat in ticket.seat {
            if self.seat.contains(seat) {
                return true
            }
            else {
                return false
            }
        }
        return false
    }

    func reserveASeat(_ seatCount: Int) {
        if self.seatCount > 0 {
            return
        }
        guard seatCount >= 1 && seatCount <= 5 else {
            return
        }
        if self.seatCount == 0 {
            self.seatCount = seatCount
            self.seat = [Int](repeating: 0, count: seatCount)
        }
    }

    func addSeatNumber(_ seatNumber: Int) {
        guard seatNumber >= 1 && seatNumber <= 45 else {
            return
        }
        self.seat.append(seatNumber)
    }

    func printTicket() {
        print("Passenger: \(self.passenger.name) \(self.passenger.surname)")
        print("Id: \(self.passenger.id)")
        print("Date: \(self.date.day)/\(self.date.month)/\(self.date.year)")
        print("Time: \(self.time.hour):\(self.time.minute)")
        print("Seat: \(self.seat)")
        print("From: \(self.fromWhere) To: \(self.whereTo)")
        print("Fee: \(self.fee)")
    }
}

