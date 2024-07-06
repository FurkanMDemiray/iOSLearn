//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Melik Demiray on 28.03.2024.
//

import Foundation


class WeatherViewModel {

    var location = Location()
    var weatherModel: WeatherModel?
    var weatherApi = WeatherApi.shared
    var iconApi = IconApi.shared

    func getWeatherData(completion: @escaping (Result<WeatherModel, WeatherError>) -> Void) {
        weatherApi.getWeatherData(latitude: location.latitude!, longitude: location.longitude!) { result in
            switch result {
            case .success(let weatherData):
                self.weatherModel = weatherData
                completion(.success(weatherData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



