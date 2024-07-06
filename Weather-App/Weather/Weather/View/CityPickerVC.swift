//
//  CityPickerVC.swift
//  Weather
//
//  Created by Melik Demiray on 11.05.2024.
//

import UIKit
import CoreLocation

protocol CityPickerDelegate: AnyObject {
    func didSelectCity(city: String, longitude: Double, latitude: Double)
}

class CityPickerVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    let cityList = [
        "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"
    ]
    var filteredCityList: [String] = []
    weak var delegate: CityPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        filteredCityList = cityList.sorted()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
    }

    private func filterCityList(searchText: String) {
        if searchText.isEmpty {
            filteredCityList = cityList
        } else {
            filteredCityList = cityList.filter { $0.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }

    private func forwardGecoordinate(for city: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { (placemarks, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            if let placemarks = placemarks {
                if let location = placemarks.first?.location {
                    self.delegate?.didSelectCity(city: city, longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
                    print("City: \(city) - Latitude: \(location.coordinate.latitude) - Longitude: \(location.coordinate.longitude)")
                    self.dismiss(animated: true)
                }
            }
        }
    }
}

// MARK: - TableViewDelegate and DataSource
extension CityPickerVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.configureCell(with: filteredCityList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCityList.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        forwardGecoordinate(for: filteredCityList[indexPath.row])
    }
}

// MARK: - SearchBarDelegate
extension CityPickerVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterCityList(searchText: searchText)
    }
}


