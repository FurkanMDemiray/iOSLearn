//
//  MusiciansClass.swift
//  AdvancedSwift
//
//  Created by Melik Demiray on 6.12.2023.
//

import Foundation


class Musiciancs{
    
    var name : String
    var age : Int
    var instrument : String
    
    init(name: String, age: Int, instrument: String) {
        self.name = name
        self.age = age
        self.instrument = instrument
    }
    
    func sing(){
        print("Nothing else matters")
    }
    
    
}
