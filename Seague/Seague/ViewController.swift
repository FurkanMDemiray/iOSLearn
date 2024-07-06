//
//  ViewController.swift
//  Seague
//
//  Created by Melik Demiray on 4.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!

    var timer = Timer()
    var counter = 10

    @IBOutlet weak var timeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.isUserInteractionEnabled = true

        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeImage))

        image.addGestureRecognizer(gesture)

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }

    @objc func timerFunc() {

        timeLbl.text = String(counter)
        counter -= 1
        if (counter == 0) {
            timer.invalidate()
        }

    }


    @objc func changeImage() {
        if (image.image == UIImage(named: "apple")) {
            image.image = UIImage(named: "indir")
        }
        else {
            image.image = UIImage(named: "apple")
        }
    }



    @IBAction func goSecondView(_ sender: Any) {
        performSegue(withIdentifier: "goToSecond", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.text = "Furkan"

        }
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Error!", message: "Error", preferredStyle: UIAlertController.Style.alert)

        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in

        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

