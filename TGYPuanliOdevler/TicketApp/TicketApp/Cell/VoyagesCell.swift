//
//  VoyagesCell.swift
//  TicketApp
//
//  Created by Melik Demiray on 23.04.2024.
//

import UIKit

class VoyagesCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var voyageFee: UILabel!
    @IBOutlet weak var voyageTime: UILabel!
    @IBOutlet weak var voyageImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    func configureCell(image: UIImage, time: String, fee: String) {
        voyageImage.image = image
        voyageTime.text = time
        voyageFee.text = fee
    }

    private func configureView() {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 5
    }

}
