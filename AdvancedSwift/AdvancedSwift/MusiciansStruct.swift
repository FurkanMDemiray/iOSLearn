//
//  MusiciansStruct.swift
//  AdvancedSwift
//
//  Created by Melik Demiray on 6.12.2023.
//

import Foundation


struct MusiciansStruct{
    
    var name : String
    var age : Int
    var Insturment : String   
    
    
    // mutating yazarsak değişkenlerde değişiklikler yapabiliyoruz.
    mutating func happyBirthday(){
        self.age += 1
    }
    
}
