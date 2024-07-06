//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by Melik Demiray on 2.02.2024.
//

import UIKit

class RootViewController: UIViewController ,RootViewModelOutput{

    private let viewModel : RootViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMainView() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true, completion: nil)
    }
    func showLoginView() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true, completion: nil)
    }
}

