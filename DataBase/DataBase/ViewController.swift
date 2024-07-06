//
//  ViewController.swift
//  DataBase
//
//  Created by Melik Demiray on 28.10.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {



    var nameArray = [String]()
    var idArray = [UUID]()

    @IBOutlet weak var tableView: UITableView!

    var choosenBook = ""
    var choosenBookId = UUID()


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self


        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))

        getData()

    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }

    @objc func getData() {

        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Simpsons")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)

            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String {
                    self.nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                self.tableView.reloadData()
            }

        } catch {
            print("error")
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()

        cell.textLabel?.text = nameArray[indexPath.row]
        return cell

    }


    @objc func addButton() {
        choosenBook = ""
        performSegue(withIdentifier: "toBookVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBookVC" {
            let destinationVC = segue.destination as! bookVC
            destinationVC.choosenBook = choosenBook
            destinationVC.choosenBookId = choosenBookId
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenBook = nameArray[indexPath.row]
        choosenBookId = idArray[indexPath.row]
        performSegue(withIdentifier: "toBookVC", sender: nil)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        if editingStyle == .delete {

            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Simpsons")
            let idString = idArray[indexPath.row].uuidString

            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)

            fetchRequest.returnsObjectsAsFaults = false

            do {
                let results = try context.fetch(fetchRequest)

                for result in results as! [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? UUID {
                        if id == idArray[indexPath.row] {
                            context.delete(result)
                            nameArray.remove(at: indexPath.row)
                            idArray.remove(at: indexPath.row)
                            self.tableView.reloadData()


                            do {
                                try context.save()
                            } catch {
                                print("error")
                            }
                            break
                        }
                    }
                }

            } catch {
                print("error")
            }
        }
    }

}

