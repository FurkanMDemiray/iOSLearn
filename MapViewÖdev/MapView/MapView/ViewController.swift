//
//  ViewController.swift
//  MapView
//
//  Created by Melik Demiray on 1.04.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var lastLocaiton = CLLocation()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        CheckLocationServices()

    }

    private func configureMapView() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }

    // create func thatt follow user location
    private func FollowUserLocation() {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        lastLocaiton = getCenterLocation(for: mapView)

    }
    // ask user permission to use location
    private func CheckLocationServices() {
        DispatchQueue.main.async {
            if CLLocationManager.locationServicesEnabled() {
                self.configureMapView()
                self.checkLocationAuthorization()

            } else {
                // show alert to turn on location
            }
        }
    }
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            FollowUserLocation()
            break
        case .denied:
            // show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }


    // center user location
    private func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }

    // get center location
    private func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude

        return CLLocation(latitude: latitude, longitude: longitude)
    }


}
extension ViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }



}
