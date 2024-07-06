//
//  ViewController.swift
//  PrayersTime
//
//  Created by Melik Demiray on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {

    var prayersViewModel = PrayersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPrayersTime()
    }

    private func fetchPrayersTime() {
        prayersViewModel.fetchPrayersTime()
    }

}

