//
//  MyTicketsVC.swift
//  TicketApp
//
//  Created by Melik Demiray on 29.04.2024.
//

import UIKit
import FirebaseFirestore

class MyTicketsVC: UIViewController {

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var tickets = [Ticket]()
    var selectedTicket: Ticket?

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingView()
        configureTableView()
        DispatchQueue.main.async {
            self.getTickets()
        }
    }

    private func showEmptyView () {
        if tickets.isEmpty {
            tableView.isHidden = true
            emptyView.isHidden = false
        } else {
            tableView.isHidden = false
            emptyView.isHidden = true
        }
    }

    private func showLoadingView() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .systemBlue
        activityIndicator.startAnimating()
        tableView.backgroundView = activityIndicator
    }

    private func hideLoadingView() {
        tableView.backgroundView = nil
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UINib(nibName: "MyTicketsCell", bundle: nil), forCellReuseIdentifier: "MyTicketsCell")
    }

    private func getTickets() {
        let db = Firestore.firestore()
        db.collection("tickets").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let ticket = Ticket()
                    ticket.passenger.name = data["name"] as? String ?? ""
                    ticket.passenger.surname = data["surname"] as? String ?? ""
                    ticket.date.stringDate = data["date"] as? String ?? ""
                    ticket.fromWhere = data["fromWhere"] as? String ?? ""
                    ticket.whereTo = data["whereTo"] as? String ?? ""
                    ticket.fee = data["fee"] as? String ?? ""
                    ticket.seats = data["seatNumbers"] as? [String] ?? []
                    ticket.documentID = document.documentID
                    self.tickets.append(ticket)
                }
                self.tableView.reloadData()
                self.hideLoadingView()
                self.showEmptyView()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShowTicket" {
            let destinationVC = segue.destination as! ShowTicketVC
            destinationVC.ticket = self.selectedTicket ?? Ticket()
        }
    }
}

extension MyTicketsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTicketsCell") as! MyTicketsCell
        cell.configureCell(with: tickets[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticket = tickets[indexPath.row]
        self.selectedTicket = ticket
        performSegue(withIdentifier: "toShowTicket", sender: ticket)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Uyarı ?", message: "Biletinizi silmek istediğinize emin misiniz ?", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "Sil", style: .destructive) { (action) in
                let db = Firestore.firestore()
                db.collection("tickets").document(self.tickets[indexPath.row].documentID!).delete { (error) in
                    if let error = error {
                        print("Error removing document: \(error)")
                    } else {
                        self.tickets.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
            }
            let cancelAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
