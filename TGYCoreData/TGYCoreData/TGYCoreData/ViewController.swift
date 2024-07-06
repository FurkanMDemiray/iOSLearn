//
//  ViewController.swift
//  TGYCoreData
//
//  Created by Melik Demiray on 3.04.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var foodNames = [String]()
    var foodImages = [UIImage]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addButtonToTopBar()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    private func addButtonToTopBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addButtonTapped() {
        performSegue(withIdentifier: "toPickVC", sender: nil)
    }

    // get data from core data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }

    private func getData() {
        foodNames.removeAll(keepingCapacity: false)
        foodImages.removeAll(keepingCapacity: false)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Foods")

        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String {
                        foodNames.append(name)
                    }
                    if let imageData = result.value(forKey: "image") as? Data {
                        if let image = UIImage(data: imageData) {
                            foodImages.append(image)
                        }
                    }
                }
            }
        } catch {
            print("Error")
        }
        tableView.reloadData()
    }

    // delete data from core data

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodNames[indexPath.row]
        cell.imageView?.image = foodImages[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Foods")
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            if name == foodNames[indexPath.row] {
                                context.delete(result)
                                do {
                                    try context.save()
                                    print("Deleted")
                                    getData()
                                } catch {
                                    print("Error")
                                }
                            }
                        }
                    }
                }
            } catch {
                print("Error")
            }
        }
    }

}

