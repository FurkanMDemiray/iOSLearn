//
//  mapVC.swift
//  Maps
//
//  Created by Melik Demiray on 1.11.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class mapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var saveButton: UIButton!
    var locationManager = CLLocationManager()
    var selectedLatitude = Double()
    var selectedLongitude = Double()

    var chosenTitle = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()

    @IBOutlet weak var nameTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()


        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gesture.minimumPressDuration = 3
        mapKit.addGestureRecognizer(gesture)

        if chosenTitle != "" {
            print(chosenTitle)

            saveButton.isHidden = true
            nameTxt.isHidden = true

            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
            annotation.coordinate = coordinate
            annotation.title = self.chosenTitle
            self.mapKit.addAnnotation(annotation)

            locationManager.stopUpdatingLocation()

            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapKit.setRegion(region, animated: true)



        }
        else {
            saveButton.isHidden = false
            nameTxt.isHidden = false

        }


    }

    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {

        if gestureRecognizer.state == .began {

            let touches = gestureRecognizer.location(in: self.mapKit)

            let coordinates = self.mapKit.convert(touches, toCoordinateFrom: self.mapKit)

            selectedLatitude = coordinates.latitude
            selectedLongitude = coordinates.longitude

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = nameTxt.text
            annotation.subtitle = "New Subtitle"

            self.mapKit.addAnnotation(annotation)

        }

    }

    @IBAction func saveBtn(_ sender: Any) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let newLocation = NSEntityDescription.insertNewObject(forEntityName: "Locations", into: context)

        newLocation.setValue(UUID(), forKey: "id")
        newLocation.setValue(nameTxt.text, forKey: "name")
        newLocation.setValue(selectedLatitude, forKey: "latitude")
        newLocation.setValue(selectedLongitude, forKey: "longitude")

        do {
            try context.save()
            print("saved")
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPlace"), object: nil)
        navigationController?.popViewController(animated: true)
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if chosenTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)

            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)


            let region = MKCoordinateRegion(center: location, span: span)

            mapKit.setRegion(region, animated: true)
        }
        else {
            //
        }


    }




}
