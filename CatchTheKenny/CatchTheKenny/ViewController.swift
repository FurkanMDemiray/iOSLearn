//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Melik Demiray on 5.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblHighscore: UILabel!

    var random = 0
    var score = 0
    var timer = Timer()
    var x = 0.0
    var y = 0.0
    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeScore))
        let gestureView = UITapGestureRecognizer(target: self, action: #selector(saveScore))
        imageView.addGestureRecognizer(gesture)


        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveImage), userInfo: nil, repeats: true)
        moveImage()

    }
    @objc func saveScore() {
        userDefault.set(lblScore, forKey: "highscore")
    }

    @objc func changeScore() {
        score += 1
        lblScore.text = String(score)

    }

    @objc func moveImage() {
        x = Double.random(in: 10.0..<200.0)
        y = Double.random(in: 200.0..<500.0)

        imageView.frame = CGRect(x: Int(x), y: Int(y), width: Int(imageView.image!.size.width) / 4, height: Int(imageView.image!.size.height) / 4)
    }

}

