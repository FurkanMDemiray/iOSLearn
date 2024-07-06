//
//  WeakInstructor.swift
//  RetainCycle
//
//  Created by Melik Demiray on 3.02.2024.
//

import Foundation

class WeakInstructor {

    let name: String
    var course: WeakCourse?

    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Instructor \(name) is being deinitialized")
    }

}


class WeakCourse {
    let name: String
    weak var instructor: WeakInstructor?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Course \(name) is being deinitialized")
    }
}
