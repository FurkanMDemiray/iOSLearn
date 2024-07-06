//
//  ViewController.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signUpBtn(_ sender: Any) {
        signUp()
    }
    @IBAction func signInBtn(_ sender: Any) {
        signIn()
    }

    private func signIn() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error {
                print(error.localizedDescription)
                self.showAlert(title: "Error", message: error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "toDoListVC", sender: nil)
            }
        }
    }

    private func signUp() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error {
                print(error.localizedDescription)
                self.showAlert(title: "Error", message: error.localizedDescription)

            } else {
                self.performSegue(withIdentifier: "toDoListVC", sender: nil)
            }
        }
    }
}

