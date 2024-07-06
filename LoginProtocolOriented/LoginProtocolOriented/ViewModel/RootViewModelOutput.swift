//
//  RootViewModelOutput.swift
//  LoginProtocolOriented
//
//  Created by Melik Demiray on 2.02.2024.
//

import Foundation



protocol RootViewModelOutput: AnyObject { // any object delegate olması için weak referans almalı

    func showMainView()
    func showLoginView()
}
