//
//  bookVC.swift
//  DataBase
//
//  Created by Melik Demiray on 28.10.2023.
//

import UIKit
import CoreData

class bookVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var nameTxt: UITextField!

    @IBOutlet weak var jobTxt: UITextField!

    @IBOutlet weak var ageTxt: UITextField!

    @IBOutlet weak var saveBtn: UIButton!
    var choosenBook = ""
    var choosenBookId: UUID?

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))

        image.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
        image.addGestureRecognizer(imageTapGesture)


        if choosenBook != "" {

            saveBtn.isHidden = true
            // core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext

            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Simpsons")
            let idString = choosenBookId?.uuidString

            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)

            fetchRequest.returnsObjectsAsFaults = false

            do {
                let results = try context.fetch(fetchRequest)

                if results.count > 0 {

                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            nameTxt.text = name
                        }
                        if let job = result.value(forKey: "job") as? String {
                            jobTxt.text = job
                        }
                        if let age = result.value(forKey: "age") as? Int {
                            ageTxt.text = String(age)
                        }
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            self.image.image = image
                        }
                    }
                }
            }
            catch {
                print("error")
            }
        }
        else
        {
            saveBtn.isHidden = false
            saveBtn.isEnabled = false
            nameTxt.text = ""
            jobTxt.text = ""
            ageTxt.text = ""
        }
    }


    @IBAction func saveButton(_ sender: Any) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let newSimpson = NSEntityDescription.insertNewObject(forEntityName: "Simpsons", into: context)

        newSimpson.setValue(nameTxt.text!, forKey: "name")
        newSimpson.setValue(jobTxt.text!, forKey: "job")
        if let age = Int(ageTxt.text!) {
            newSimpson.setValue(age, forKey: "age")
        }

        newSimpson.setValue(UUID(), forKey: "id")

        let imageData = image.image?.jpegData(compressionQuality: 0.5)

        newSimpson.setValue(imageData, forKey: "image")

        do {
            try context.save()
            print("saved")
        }
        catch {
            print("error")
        }

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        self.navigationController?.popViewController(animated: true)

    }

    // get data from core data

    func getData() {


    }

    @objc func selectImage() {

        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        image.image = info[.originalImage] as? UIImage
        saveBtn.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }

    @objc func hideKeyboard()
    {
        view.endEditing(true)
    }



}
