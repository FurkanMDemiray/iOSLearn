//
//  AlertExtension.swift
//  TicketApp
//
//  Created by Melik Demiray on 28.04.2024.
//

import Foundation
import UIKit


extension UIViewController {

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
