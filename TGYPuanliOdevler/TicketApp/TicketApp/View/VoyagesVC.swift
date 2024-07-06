//
//  VoyagesVC.swift
//  TicketApp
//
//  Created by Melik Demiray on 23.04.2024.
//

import UIKit
import FirebaseFirestore

class VoyagesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var ticket: Ticket = Ticket()
    var from: String = ""
    var to: String = ""
    var voyageTimes: [String] = []
    var voyageFees: [String] = []
    var voyagesId = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingView()
        configureCollectionView()
        setNavigationBar()
        DispatchQueue.main.async {
            self.getVoyages()
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

    private func getVoyages() {
        let db = Firestore.firestore()
        db.collection("voyages").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let time = data["time"] as! String
                    let fee = data["fee"] as! String
                    self.voyageTimes.append(time)
                    self.voyageFees.append(fee)
                }
                self.tableView.reloadData()
                self.hideLoadingView()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BusVC.chosenSeats.removeAll()
    }

    private func setNavigationBar() {
        let label = UILabel()
        from = ticket.fromWhere
        to = ticket.whereTo
        label.text = "\(from) - \(to)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        // custom color
        label.textColor = .systemBlue
        navigationItem.titleView = label
    }

    private func configureCollectionView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "VoyagesCell", bundle: nil), forCellReuseIdentifier: "VoyagesCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBusVC" {
            let destinationVC = segue.destination as! BusVC
            destinationVC.ticket = ticket
            destinationVC.voyagesId = voyagesId
        }
    }
}

extension VoyagesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voyageFees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoyagesCell", for: indexPath) as! VoyagesCell
        cell.configureCell(image: UIImage(named: "tokatSeyahat")!, time: voyageTimes[indexPath.row], fee: voyageFees[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ticket.time.hour = voyageTimes[indexPath.row]
        ticket.fee = voyageFees[indexPath.row]
        voyagesId = "\(indexPath.row)"
        performSegue(withIdentifier: "toBusVC", sender: nil)
    }
}
