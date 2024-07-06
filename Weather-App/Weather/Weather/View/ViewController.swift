//
//  ViewController.swift
//  Weather
//
//  Created by Melik Demiray on 11.05.2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, CityPickerDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var humiditylabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var tempatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    var weatherViewModel = WeatherViewModel()

// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOuterView()
        setDate()
        configureCityLabel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading()
    }
// MARK: - City Label
    private func configureCityLabel() {
        cityLabel.text = "Select City"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cityLabelTapped))
        cityLabel.isUserInteractionEnabled = true
        cityLabel.addGestureRecognizer(tapGesture)
    }

    @objc private func cityLabelTapped() {
        performSegue(withIdentifier: "toCityPickerVC", sender: nil)
    }
// MARK: - Configure Views
    private func setDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        self.dateLabel.text = formatter.string(from: Date.now)
    }

    private func showLoading() {
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    private func hideLoading() {
        dismiss(animated: true, completion: nil)
    }

    private func configureOuterView() {
        outerView.layer.cornerRadius = 20
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = .zero
        outerView.layer.shadowRadius = 10
    }
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityPickerVC" {
            if let destinationVC = segue.destination as? CityPickerVC {
                destinationVC.delegate = self
            }
        }
    }
// MARK: - CityPickerDelegate Fetch Weather
    func didSelectCity(city: String, longitude: Double, latitude: Double) {
        weatherViewModel.fetchWeather(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let weather):
                self.cityLabel.text = city
                self.humiditylabel.text = "\(weather.main?.humidity ?? 0) %"
                self.windSpeedLabel.text = "\(weather.wind?.speed ?? 0) km/h"
                self.weatherStatusLabel.text = "\(weather.weather?[0].description?.capitalized ?? "")"
                self.tempatureLabel.text = "\(weather.main?.temp ?? 0)°C"

                if weather.weather?[0].description?.contains("rain") == true {
                    self.weatherImageView.image = UIImage(named: "rain")
                } else if weather.weather?[0].description?.contains("few clouds") == true {
                    self.weatherImageView.image = UIImage(named: "fewClouds")
                }
                else if weather.weather?[0].description?.contains("cloud") == true {
                    self.weatherImageView.image = UIImage(named: "clouds")
                }
                else if weather.weather?[0].description?.contains("snow") == true {
                    self.weatherImageView.image = UIImage(named: "snow")
                }
                else if weather.weather?[0].description?.contains("clear") == true {
                    self.weatherImageView.image = UIImage(named: "sun")
                }
                else if weather.weather?[0].description?.contains("thunderstorm") == true {
                    self.weatherImageView.image = UIImage(named: "thunderStorm")
                }
                else if weather.weather?[0].description?.contains("mist") == true {
                    self.weatherImageView.image = UIImage(named: "mist")
                }

            case .failure(let error):
                print(error)
            }
            self.hideLoading()
        }
    }
}

