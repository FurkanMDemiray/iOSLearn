//
//  ViewController.swift
//  FitnessTracking
//
//  Created by Melik Demiray on 2.03.2024.
//

import UIKit
import Firebase

class LoginView: UIViewController {

    let loginViewModel = LoginViewModel()

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func SignUp(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text {
            loginViewModel.signUp(email: email, password: password)
            NotificationCenter.default.addObserver(self, selector: #selector(alertSignUp(_:)), name: .showAlertSignUp, object: nil)
            performSegue(withIdentifier: "toTabBarVC", sender: nil)
        }
    }
    @IBAction func LogIn(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text {
            loginViewModel.logIn(email: email, password: password)
            NotificationCenter.default.addObserver(self, selector: #selector(alertLogin(_:)), name: .showAlertLogin, object: nil)
            performSegue(withIdentifier: "toTabBarVC", sender: nil)
        }
    }
    
    @objc func alertLogin(_ notification: Notification) {
        if let errorMessage = notification.object as? String {
                    makeAlert(titleInput: "Error", messageInput: errorMessage)
                    print("Login Error: \(errorMessage)")
                    // Burada, örneğin bir alert gösterebilirsiniz
        }else{
            makeAlert(titleInput: "Success", messageInput: "User Logged In")
        }
    }
    @objc func alertSignUp(_ notification: Notification) {
        if let errorMessage = notification.object as? String {
                    makeAlert(titleInput: "Error", messageInput: errorMessage)
                    print("Sign Up Error: \(errorMessage)")
                    // Burada, örneğin bir alert gösterebilirsiniz
        }else{
            makeAlert(titleInput: "Success", messageInput: "User Created")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

