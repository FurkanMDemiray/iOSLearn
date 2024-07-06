//
//  ViewController.swift
//  test2
//
//  Created by Melik Demiray on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var textBirthday: UITextField!
    @IBOutlet weak var textName: UITextField!

    @IBOutlet weak var labelName: UILabel!

    @IBOutlet weak var labelBirthday: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        createLabel()
        getName()
    }

    @IBAction func sumBtn(_ sender: Any) {

        if let num1 = Int(text1.text!), let num2 = Int(text2.text!) {
            let res = num1 + num2
            label.text = String(res)
        }
        else {
            print("error")
        }
    }
    @IBAction func getNameAndBirthday(_ sender: Any) {

        if let name = textName.text, let birthday = textBirthday.text {
            labelName.text = "Name: \(name)"
            labelBirthday.text = birthday

            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(name, forKey: "birthday")


        }
        else {
            print("error")
        }
    }
    @IBAction func toSecond(_ sender: Any) {
        performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    
    func getName() {
        labelName.text = UserDefaults.standard.string(forKey: "name")

        labelBirthday.text = UserDefaults.standard.string(forKey: "birthday")
    }
    func createLabel() {

        let labelTest = UILabel()
        labelTest.text = "Test Control"
        labelTest.textAlignment = .center
        labelTest.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(labelTest)
    }

}

