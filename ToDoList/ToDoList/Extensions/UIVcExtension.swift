//
//  UIVcExtension.swift
//  ToDoList
//
//  Created by Melik Demiray on 14.04.2024.
//

import Foundation
import UIKit


extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}
