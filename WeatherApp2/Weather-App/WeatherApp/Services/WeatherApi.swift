//
//  WeatherApi.swift
//  WeatherApp
//
//  Created by Melik Demiray on 28.03.2024.
//

import Foundation

enum WeatherError: Error {
    case invalidUrl
    case invalidData
    case decodingError
}

class WeatherApi {

    static let shared = WeatherApi()

    private init() { }

  func getWeatherData(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherModel, WeatherError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=7322abaed58e1f99fa30adbc734b7ae7") else {
            completion(.failure(.invalidUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let weatherData = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}




