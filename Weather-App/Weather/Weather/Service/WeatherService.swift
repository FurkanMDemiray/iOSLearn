//
//  WeatherService.swift
//  Weather
//
//  Created by Melik Demiray on 11.05.2024.
//

import Foundation
import Alamofire

class WeatherService {

    static let shared = WeatherService()

    private init() { }

    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=7322abaed58e1f99fa30adbc734b7ae7&units=metric"

        AF.request(url).responseDecodable(of: WeatherModel.self) { response in
            switch response.result {
            case .success(let weather):
                completion(.success(weather))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
