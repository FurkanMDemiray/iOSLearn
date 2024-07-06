//
//  ImagePickerViewController.swift
//  TGYCoreData
//
//  Created by Melik Demiray on 3.04.2024.
//

import UIKit
import CoreData

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureImageView()
    }

    private func configureImageView() {
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectImageTapped))
        imageView.addGestureRecognizer(tap)

    }

    @objc func selectImageTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newImage = NSEntityDescription.insertNewObject(forEntityName: "Foods", into: context)
        newImage.setValue(textField.text, forKey: "name")
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        newImage.setValue(imageData, forKey: "image")
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Error")
        }
        navigationController?.popViewController(animated: true)
    }

}

