//
//  CityCell.swift
//  Weather
//
//  Created by Melik Demiray on 11.05.2024.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cellView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }

    private func configureCellView() {
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cellView.layer.shadowOpacity = 0.4
        cellView.layer.shadowRadius = 4
    }

    func configureCell(with city: String) {
        cityLabel.text = city
    }
}
