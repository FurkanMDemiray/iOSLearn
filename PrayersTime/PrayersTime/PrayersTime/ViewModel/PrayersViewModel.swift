//
//  PrayersViewModel.swift
//  PrayersTime
//
//  Created by Melik Demiray on 12.05.2024.
//

import Foundation

class PrayersViewModel: ObservableObject {

    var prayers = PrayersModel(success: nil, result: nil) {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    func fetchPrayersTime(city: String) {
        WebService.shared.fetchPrayersTime(city: city) { result in
            switch result {
            case .success(let prayers):
                self.prayers = prayers
                print(prayers)
            case .failure(let error):
                print(error)
            }
        }
    }
}

