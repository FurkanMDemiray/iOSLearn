//
//  Simpsons.swift
//  Simpson
//
//  Created by Melik Demiray on 27.10.2023.
//

import Foundation
import UIKit


class Simpsons {

    var name: String
    var job: String
    var image = UIImage()


    init(name: String, job: String, image: UIImage) {
        self.name = name
        self.job = job
        self.image = image
    }
}
