//
//  IconApi.swift
//  WeatherApp
//
//  Created by Melik Demiray on 28.03.2024.
//

import Foundation


class IconApi {
    static let shared = IconApi()
    private init() { }

    // get image from url with urlsession
    func getIconImage(icon: String) -> Data {
        let url = URL(string: "https://openweathermap.org/img/w/\(icon).png")!
        let data = try! Data(contentsOf: url)
        return data
    }
}
