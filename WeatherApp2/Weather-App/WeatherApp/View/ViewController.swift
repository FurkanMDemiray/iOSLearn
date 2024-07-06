//
//  ViewController.swift
//  WeatherApp
//
//  Created by Melik Demiray on 28.03.2024.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var weatherViewModel = WeatherViewModel()

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTypeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        getData()

    }
    private func getData() {
        weatherViewModel.getWeatherData { result in
            switch result {
            case .success(let weatherData):
                //print("Weather data: \(weatherData)")
                DispatchQueue.main.async {
                    // kelvin to celsius
                    let temp = Int((weatherData.main?.temp ?? 0) - 273.15)
                    self.tempLabel.text = "\(temp)°C"
                    self.countryLabel.text = weatherData.name
                    self.weatherTypeLabel.text = weatherData.weather?[0].main

                    let Ico = weatherData.weather?[0].icon ?? ""
                    let urlData = self.weatherViewModel.iconApi.getIconImage(icon: Ico)
                    self.weatherImage.image = UIImage(data: urlData as Data)

                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    private func configureLocationManager() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        guard let location = locationManager.location else { return }
        weatherViewModel.location.latitude = location.coordinate.latitude
        weatherViewModel.location.longitude = location.coordinate.longitude
        print("Found user's location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
}

