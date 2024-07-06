//
//  KeyboardExtension.swift
//  TicketApp
//
//  Created by Melik Demiray on 28.04.2024.
//

import Foundation
import UIKit

extension PaymentVC{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PaymentVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
