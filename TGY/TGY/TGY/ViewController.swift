//
//  ViewController.swift
//  TGY
//
//  Created by Melik Demiray on 22.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        let city = City(name: "Istanbul", detail: "Istanbul is a city in Turkey.", image: "istanbul")
        cell.setUpCell(city: city)
        return cell
    }
}
