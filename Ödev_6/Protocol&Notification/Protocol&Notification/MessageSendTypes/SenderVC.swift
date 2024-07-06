//
//  SenderVC.swift
//  Protocol&Notification
//
//  Created by Melik Demiray on 26.03.2024.
//

import UIKit


protocol SendMessageDelegate: AnyObject {
    func sendMessage(message: String)
}

class SenderVC: UIViewController {

    @IBOutlet weak var textField: UITextField!

    weak var delegate: SendMessageDelegate?
    var closure: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        guard let message = textField.text else { return }
        delegate?.sendMessage(message: message)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func notificationSendButton(_ sender: Any) {
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: ["message": textField.text!])
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closureSendButton(_ sender: Any) {
        guard let text = textField.text else { return }
        closure?(text)
        dismiss(animated: true, completion: nil)
    }
}
