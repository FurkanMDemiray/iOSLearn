//
//  UserViewModelProcotol.swift
//  ProtocolOriented
//
//  Created by Melik Demiray on 23.01.2024.
//

import Foundation


protocol UserViewModelProcotol: AnyObject {

    func updateView(name: String, email: String, userName: String)

}
