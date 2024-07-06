//
//  ViewController.swift
//  Maps
//
//  Created by Melik Demiray on 30.10.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var nameArray = [String]()
    var idArray = [UUID]()
    var longtitudeArray = [Double]()
    var lattitudeArray = [Double]()

    var selectedName = ""
    var selectedLattitude = Double()
    var selectedLongtitude = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Set the delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self


        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addBtnClicked))


        getDataDB()
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getDataDB), name: NSNotification.Name(rawValue: "newPlace"), object: nil)
            
    }
    
    @objc func getDataDB()
    {
        // get data from core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Locations")

        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)

            if results.count > 0 {

                self.nameArray.removeAll(keepingCapacity: false)
                self.idArray.removeAll(keepingCapacity: false)
                self.lattitudeArray.removeAll(keepingCapacity: false)
                self.longtitudeArray.removeAll(keepingCapacity: false)

                for result in results as! [NSManagedObject]
                {
                    if let name = result.value(forKey: "name") as? String
                    {
                        self.nameArray.append(name)
                    }

                    if let id = result.value(forKey: "id") as? UUID
                    {
                        self.idArray.append(id)
                    }

                    if let lattitude = result.value(forKey: "latitude") as? Double
                    {
                        self.lattitudeArray.append(lattitude)
                    }

                    if let longtitude = result.value(forKey: "longitude") as? Double
                    {
                        self.longtitudeArray.append(longtitude)
                    }

                    self.tableView.reloadData()
                }
            }

        } catch {
            print("error")
        }


    }

    @objc func addBtnClicked()
    {
        // perform segue
        selectedName = ""
        selectedLattitude = 0.0
        selectedLongtitude = 0.0
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idArray.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectedName = nameArray[indexPath.row]
        selectedLattitude = lattitudeArray[indexPath.row]
        selectedLongtitude = longtitudeArray[indexPath.row]
        performSegue(withIdentifier: "toMapVC", sender: nil)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toMapVC"
        {
            let destinationVC = segue.destination as! mapVC
            destinationVC.chosenLatitude = selectedLattitude
            destinationVC.chosenLongitude = selectedLongtitude
            destinationVC.chosenTitle = selectedName
        }
    }

}

