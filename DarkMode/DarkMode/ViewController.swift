//
//  ViewController.swift
//  DarkMode
//
//  Created by Melik Demiray on 4.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()



        let userInterfaceStyle = traitCollection.userInterfaceStyle


        if userInterfaceStyle == .dark {

            label.textColor = UIColor.white
            button.tintColor = UIColor.white

        }
        else {

            label.textColor = UIColor.black
            button.tintColor = UIColor.black

        }
    }




}

