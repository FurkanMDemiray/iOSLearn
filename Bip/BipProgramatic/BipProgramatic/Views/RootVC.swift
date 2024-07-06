//
//  ViewController.swift
//  BipProgramatic
//
//  Created by Melik Demiray on 7.04.2024.
//

import UIKit

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabbar.view)
        tabbar.selectedIndex = 1
        view.backgroundColor = .white
    }

    let tabbar: UITabBarController = {
        let tabbar = UITabBarController()
        tabbar.view.translatesAutoresizingMaskIntoConstraints = false

        let status = StatusVC()
        let messages = MessagesVC()
        let calls = CallsVC()
        let discover = DiscoverVC()
        let more = MoreVC()
        tabbar.setViewControllers([status, messages, calls, discover, more], animated: true)

        status.tabBarItem = UITabBarItem(title: "Durum", image: UIImage(systemName: "1.circle"), tag: 0)
        messages.tabBarItem = UITabBarItem(title: "Mesajlar", image: UIImage(systemName: "message"), tag: 1)
        calls.tabBarItem = UITabBarItem(title: "Aramalar", image: UIImage(systemName: "phone"), tag: 2)
        discover.tabBarItem = UITabBarItem(title: "Keşfet", image: UIImage(systemName: "safari"), tag: 2)
        more.tabBarItem = UITabBarItem(title: "Daha Fazla", image: UIImage(systemName: "gear"), tag: 2)
        return tabbar
    }()

    private func configureTabbar() {
        tabbar.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tabbar.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabbar.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabbar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureTabbar()
    }
}

