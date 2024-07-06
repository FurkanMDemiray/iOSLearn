//
//  ViewController.swift
//  TableView
//
//  Created by Melik Demiray on 9.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var landMark = [String] ()
    var landMarkImage = [UIImage]()
    var lands = [LandMark]()


    struct LandMark {
        var name: String = ""
        var source: UIImage = UIImage(named: "kenny")!
    }

    var land1 = LandMark()
    var land2 = LandMark()

    var selectedImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()


        land1.name = "kenny"
        land1.source = UIImage(named: "kenny")!

        land2.name = "pisa"
        land2.source = UIImage(named: "indir")!

        lands.append(land1)
        lands.append(land2)

        landMark.append("kenny")
        landMark.append("pisa")

        landMarkImage.append(UIImage(named: "kenny")!)
        landMarkImage.append(UIImage(named: "indir")!)

        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lands.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        var content = cell.defaultContentConfiguration()
        content.text = landMark[indexPath.row]
        content.image = landMarkImage[indexPath.row]
        cell.contentConfiguration = content


        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedImage = landMarkImage[indexPath.row]
        performSegue(withIdentifier: "secondVC", sender: nil)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.imageSoruce = selectedImage

        }

    }

}

