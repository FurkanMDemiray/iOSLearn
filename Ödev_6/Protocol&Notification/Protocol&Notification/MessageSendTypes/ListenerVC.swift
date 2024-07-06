//
//  ViewController.swift
//  Protocol&Notification
//
//  Created by Melik Demiray on 26.03.2024.
//

import UIKit

class ListenerVC: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // notification ile mesaj alma
        NotificationCenter.default.addObserver(forName: .sendDataNotification, object: nil, queue: nil) { notification in
            if let message = notification.userInfo?["message"] as? String {
                self.messageLabel.text = message
            }
        }
       
        // closure ile mesaj alma
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let senderVC = storyBoard.instantiateViewController(identifier: "SenderVC") as! SenderVC
        senderVC.closure = { message in
            self.messageLabel.text = message
        }
    }

    @IBAction func getButton(_ sender: Any) {
        let senderVC = storyboard?.instantiateViewController(identifier: "SenderVC") as! SenderVC
        senderVC.delegate = self
        present(senderVC, animated: true, completion: nil)
    }

    @objc func getNotification() {
        messageLabel.text = "Notification Received"
    }
}

extension ListenerVC: SendMessageDelegate {
    func sendMessage(message: String) {
        messageLabel.text = message
    }
}
