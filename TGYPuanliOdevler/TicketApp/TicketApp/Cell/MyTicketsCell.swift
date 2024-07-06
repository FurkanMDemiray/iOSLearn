//
//  MyTicketsCell.swift
//  TicketApp
//
//  Created by Melik Demiray on 29.04.2024.
//

import UIKit

class MyTicketsCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var fromToWhereLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    private func configureView() {
        outerView.layer.cornerRadius = 10
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = .zero
        outerView.layer.shadowRadius = 5
        outerView.layer.masksToBounds = false
    }

    func configureCell(with ticket: Ticket) {
        fromToWhereLabel.text = "\(ticket.fromWhere) - \(ticket.whereTo)"
        dateLabel.text = ticket.date.stringDate
        nameLabel.text = "\(ticket.passenger.name) \(ticket.passenger.surname)"
    }

}
