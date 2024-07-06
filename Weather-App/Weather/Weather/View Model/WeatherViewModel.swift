//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Melik Demiray on 11.05.2024.
//

import Foundation

class WeatherViewModel {

    var weather: WeatherModel?

    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        WeatherService.shared.fetchWeather(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                completion(.success(weather))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
