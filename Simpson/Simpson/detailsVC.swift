//
//  detailVC.swift
//  Simpson
//
//  Created by Melik Demiray on 27.10.2023.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var jobTxt: UILabel!

    var simpson: Simpsons?

    override func viewDidLoad() {
        super.viewDidLoad()



        nameTxt.text = simpson?.name
        jobTxt.text = simpson?.job
        image.image = simpson?.image


    }




}
