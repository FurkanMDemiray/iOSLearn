//
//  ShowTicketVC.swift
//  TicketApp
//
//  Created by Melik Demiray on 29.04.2024.
//

import UIKit

class ShowTicketVC: UIViewController {

    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var fromToWhereLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var ticket = Ticket()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }

    private func setLabels() {
        nameLabel.text = "Ad: \(ticket.passenger.name) \(ticket.passenger.surname)"
        dateLabel.text = "Tarih: \(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year)"
        fromToWhereLabel.text = "\(ticket.fromWhere) -> \(ticket.whereTo)"
        feeLabel.text = "Ücret: \(ticket.fee)"
        seatsLabel.text = "Koltuklar: \(ticket.seats?.joined(separator: ", ") ?? "")"
    }
}
