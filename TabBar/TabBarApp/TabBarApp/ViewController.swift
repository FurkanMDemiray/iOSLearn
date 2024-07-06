//
//  ViewController.swift
//  TabBarApp
//
//  Created by Melik Demiray on 1.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ilanVerTabBar: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ConfigureTabBar()
    }


    private func ConfigureTabBar(){

        guard let tabBarController = self.tabBarController?.tabBar else { return }
        tabBarController.layer.borderWidth = 0.50

        guard let ilanVerTabBar = self.tabBarController?.tabBar.items?[2] else { return }
        ilanVerTabBar.title = "İlan Ver"
        ilanVerTabBar.image = UIImage(systemName: "plus.circle.fill")
        ilanVerTabBar.selectedImage = UIImage(systemName: "plus.circle.fill")
        ilanVerTabBar.badgeValue = "Yeni"
        ilanVerTabBar.badgeColor = .red
    }
}

