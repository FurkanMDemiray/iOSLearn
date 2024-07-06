//
//  Instructor.swift
//  RetainCycle
//
//  Created by Melik Demiray on 3.02.2024.
//

import Foundation


class Instructor {

    let name: String
    var course: Course?

    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Instructor \(name) is being deinitialized")
    }

}


class Course {
    let name: String
    var instructor: Instructor?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Course \(name) is being deinitialized")
    }
}
