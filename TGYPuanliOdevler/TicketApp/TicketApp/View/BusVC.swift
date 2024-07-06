//
//  BusVC.swift
//  TicketApp
//
//  Created by Melik Demiray on 25.04.2024.
//

import UIKit
import FirebaseFirestore

class BusVC: UIViewController {

    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var tableStackView: UIStackView!
    @IBOutlet weak var seatFortyOneLabel: UILabel!
    @IBOutlet weak var seatFortyTwoLabel: UILabel!
    @IBOutlet weak var seatFortyThreeLabel: UILabel!
    @IBOutlet weak var seatFortyFourLabel: UILabel!
    @IBOutlet weak var seatFortyFiveLabel: UILabel!

    let leftSideLeftSeats = ["1", "5", "9", "13", "17", "21", "25", "29", "33", "37"]
    let leftSideRightSeats = ["2", "6", "10", "14", "18", "22", "26", "30", "34", "38"]
    let rightSideLeftSeats = ["3", "7", "11", "15", "19", "23", "27", "31", "35", "39"]
    let rightSideRightSeats = ["4", "8", "12", "16", "20", "24", "28", "32", "36", "40"]

    var seats: [String: Bool]?
    var voyagesId = ""

    var ticket = Ticket()
    public static var chosenSeats = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViews()
        configureTableStackView()
        configureSeatLabels()
        addButtonToNavigationBar()
        addGestureToSeatLabels()
        DispatchQueue.main.async {
            self.getVoyageSeats()
        }
    }

    private func configureSeatLabels() {
        seatFortyOneLabel.isUserInteractionEnabled = true
        seatFortyTwoLabel.isUserInteractionEnabled = true
        seatFortyThreeLabel.isUserInteractionEnabled = true
        seatFortyFourLabel.isUserInteractionEnabled = true
        seatFortyFiveLabel.isUserInteractionEnabled = true
    }

    private func addGestureToSeatLabels() {
        for seatLabel in [seatFortyOneLabel, seatFortyTwoLabel, seatFortyThreeLabel, seatFortyFourLabel, seatFortyFiveLabel] {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(seatLabelTapped(_:)))
            seatLabel!.addGestureRecognizer(tapGesture)
        }
    }

    @objc private func seatLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let seatLabel = sender.view as? UILabel else { return }
        guard let seatNumber = seatLabel.text else { return }

        if BusVC.chosenSeats.count < 5 && seatLabel.textColor != .systemGreen && seatLabel.textColor != .systemRed {
            BusVC.chosenSeats.append(seatNumber)
            seatLabel.textColor = .systemGreen
        }
        else if seatLabel.textColor == .systemRed {
            self.showAlert(title: "Uyarı", message: "Bu koltuk satın alınmıştır.")
        }
        else {
            seatLabel.textColor = .black
            if let index = BusVC.chosenSeats.firstIndex(of: seatNumber) {
                BusVC.chosenSeats.remove(at: index)
            } else {
                self.showAlert(title: "Uyarı", message: "En fazla 5 koltuk seçebilirsiniz.")
            }
        }
    }

    private func checkLastFiveSeatStatus() {
        for seat in ["41", "42", "43", "44", "45"] {
            if seats![seat]! {
                switch seat {
                case "41":
                    seatFortyOneLabel.textColor = .systemRed
                case "42":
                    seatFortyTwoLabel.textColor = .systemRed
                case "43":
                    seatFortyThreeLabel.textColor = .systemRed
                case "44":
                    seatFortyFourLabel.textColor = .systemRed
                case "45":
                    seatFortyFiveLabel.textColor = .systemRed
                default:
                    break
                }
            }
        }
    }

    private func getVoyageSeats() {
        let db = Firestore.firestore()
        db.collection("voyages").document(voyagesId).getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                self.seats = data!["seats"] as? [String: Bool] ?? [:]
                self.leftTableView.reloadData()
                self.rightTableView.reloadData()
                self.checkLastFiveSeatStatus()
            }
        }
    }

    private func configureTableViews() {
        rightTableView.delegate = self
        rightTableView.dataSource = self
        leftTableView.delegate = self
        leftTableView.dataSource = self

        rightTableView.separatorStyle = .none
        rightTableView.showsVerticalScrollIndicator = false
        leftTableView.separatorStyle = .none
        leftTableView.showsVerticalScrollIndicator = false

        rightTableView.isScrollEnabled = false
        leftTableView.isScrollEnabled = false

        rightTableView.allowsSelection = false
        leftTableView.allowsSelection = false

        rightTableView.register(UINib(nibName: "BusSeatCell", bundle: nil), forCellReuseIdentifier: "BusSeatCell")
        leftTableView.register(UINib(nibName: "BusSeatCell", bundle: nil), forCellReuseIdentifier: "BusSeatCell")
    }

    private func configureTableStackView() {
        let screenWidth = UIScreen.main.bounds.width

        if screenWidth < 380 {
            tableStackView.spacing = 175
        } else {
            tableStackView.spacing = 195
        }
    }

    private func addButtonToNavigationBar() {
        let button = UIButton(type: .system)
        button.setTitle("Ödeme", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(ticketButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }

    @objc private func ticketButtonTapped() {
        if BusVC.chosenSeats.isEmpty {
            showAlert(title: "Uyarı", message: "Lütfen bir koltuk seçiniz.")
            return
        }
        else {
            performSegue(withIdentifier: "toPaymentVC", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPaymentVC" {
            let destinationVC = segue.destination as! PaymentVC
            destinationVC.ticket = ticket
            destinationVC.voyagesId = voyagesId
        }
    }
}

extension BusVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftSideLeftSeats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == rightTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusSeatCell", for: indexPath) as! BusSeatCell
            cell.configureCell(with: rightSideLeftSeats[indexPath.row], with: rightSideRightSeats[indexPath.row], seats: seats ?? [:])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusSeatCell", for: indexPath) as! BusSeatCell
            cell.configureCell(with: leftSideLeftSeats[indexPath.row], with: leftSideRightSeats[indexPath.row], seats: seats ?? [:])
            return cell
        }
    }
}
