//
//  SecondViewController.swift
//  TableView
//
//  Created by Melik Demiray on 9.10.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var lblName = ""
    var imageSoruce = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = lblName
        image.image = imageSoruce
        

    }



}
