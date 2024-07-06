//
//  ViewController.swift
//  Simpson
//
//  Created by Melik Demiray on 26.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {



    @IBOutlet weak var tableView: UITableView!

    var simpsonsArray = [Simpsons]()
    var chosenSimpson: Simpsons?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self


        let homer = Simpsons(name: "Homer", job: "Nuclear Safety", image: UIImage(named: "Homer")!)
        let bart = Simpsons(name: "Bart", job: "Student", image: UIImage(named: "Bart")!)
        let lisa = Simpsons(name: "Lisa", job: "Student", image: UIImage(named: "Lisa")!)
        let marge = Simpsons(name: "Margeret", job: "Housewife", image: UIImage(named: "Marge")!)

        simpsonsArray.append(homer)
        simpsonsArray.append(bart)
        simpsonsArray.append(lisa)
        simpsonsArray.append(marge)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonsArray[indexPath.row]
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let destinationVC = segue.destination as! detailVC
            destinationVC.simpson = chosenSimpson
        }
    }

}

