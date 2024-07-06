//
//  PaymentVC.swift
//  TicketApp
//
//  Created by Melik Demiray on 28.04.2024.
//

import UIKit
import FirebaseFirestore

class PaymentVC: UIViewController {

    @IBOutlet weak var ticketImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var citiesLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var seatNumbersLabel: UILabel!

    var isButtonClicked = false
    var ticket = Ticket()
    var voyagesId = ""
    var seats: [String: Bool] = [:]
    var db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTicketImageViewAndLabels()
        //changeConstraintDependingOnScreenSize()
    }

    private func changeConstraintDependingOnScreenSize() {
        if UIScreen.main.bounds.height < 700 {
            seatNumbersLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -142).isActive = true
        }
    }

    private func hideTicketImageViewAndLabels() {
        ticketImageView.isHidden = true
        nameLabel.isHidden = true
        dateLabel.isHidden = true
        citiesLabel.isHidden = true
        feeLabel.isHidden = true
        seatNumbersLabel.isHidden = true
    }

    private func showTicketImageViewAndLabels() {
        UIView.transition(with: ticketImageView, duration: 0.8, options: .transitionCurlDown, animations: {
            self.ticketImageView.isHidden = false
        })
        addAnimationAndShow(with: nameLabel)
        addAnimationAndShow(with: dateLabel)
        addAnimationAndShow(with: citiesLabel)
        addAnimationAndShow(with: feeLabel)
        addAnimationAndShow(with: seatNumbersLabel)
    }

    private func setLabels() {
        nameLabel.text = "Ad: \(ticket.passenger.name) \(ticket.passenger.surname)"
        dateLabel.text = "Tarih: \(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year)"
        citiesLabel.text = "\(ticket.fromWhere) -> \(ticket.whereTo)"
        feeLabel.text = "Ücret: \(ticket.fee)"
        seatNumbersLabel.text = "Koltuklar: \(BusVC.chosenSeats.joined(separator: ", "))"
    }

    private func addAnimationAndShow(with label: UILabel) {
        UIView.transition(with: label, duration: 0.8, options: .transitionCrossDissolve, animations: {
            label.isHidden = false
        })
    }

    @IBAction func buyTicketButtonClicked(_ sender: Any) {
        if let name = nameTextField.text, let surname = surnameTextField.text, !isButtonClicked {
            if name != "" && surname != "" {
                ticket.passenger.name = name
                ticket.passenger.surname = surname
                print("******Passenger Info******")
                ticket.passenger.printPassenger()
                print("******Ticket Info******")
                ticket.printTicket()
                print("******Date Info******")
                ticket.date.printDate()
                setLabels()
                showTicketImageViewAndLabels()
                isButtonClicked = true
                addTicketToDatabase()
                getCurrentSeatsAndUpdate()
                performSegueAfterAlert()
            }
            else {
                self.showAlert(title: "Hata", message: "Lütfen adınızı ve soyadınızı giriniz.")
            }
        }
    }

    private func performSegueAfterAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.performSegue(withIdentifier: "toMyTicketsVC", sender: nil)
        }
    }

    private func addTicketToDatabase() {
        db = Firestore.firestore()
        let ticketRef = db.collection("tickets").document()
        let ticketData: [String: Any] = [
            "name": ticket.passenger.name,
            "surname": ticket.passenger.surname,
            "fromWhere": ticket.fromWhere,
            "whereTo": ticket.whereTo,
            "date": "\(ticket.date.day)/\(ticket.date.month)/\(ticket.date.year)",
            "fee": ticket.fee,
            "seatNumbers": BusVC.chosenSeats
        ]
        ticketRef.setData(ticketData) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
            }
            else {
                print("Document added with ID: \(ticketRef.documentID)")
            }
        }
    }

    private func getCurrentSeatsAndUpdate() {
        db = Firestore.firestore()
        let voyageRef = db.collection("voyages").document(voyagesId)
        voyageRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if let seats = data?["seats"] as? [String: Bool] {
                    self.seats = seats
                    self.addNewSeats()
                }
            }
            else {
                print("Document does not exist")
            }
            self.updateVoyageSeats()
        }
    }

    private func addNewSeats() {
        for seat in BusVC.chosenSeats {
            seats[seat] = true
        }
    }

    private func updateVoyageSeats() {
        let voyageRef = db.collection("voyages").document(voyagesId)
        voyageRef.updateData([
            "seats": seats
            ]) { (error) in
            if let error = error {
                print("Error updating document: \(error)")
            }
            else {
                print("Document successfully updated")
            }
        }
    }
}
