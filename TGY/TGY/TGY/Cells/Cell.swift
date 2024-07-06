//
//  Cell.swift
//  TGY
//
//  Created by Melik Demiray on 24.03.2024.
//


import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUpCell(city: City) {
        cityImage.image = UIImage(named: city.image!)
        cityName.text = city.name
        detailLabel.text = city.detail
    }
}
