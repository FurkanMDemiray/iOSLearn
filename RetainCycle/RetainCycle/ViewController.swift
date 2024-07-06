//
//  ViewController.swift
//  RetainCycle
//
//  Created by Melik Demiray on 3.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        var course: Course? = Course(name: "iOS Development")
        var instructor: Instructor? = Instructor(name: "Melik")
        
        // strong refence cycle
        course?.instructor = instructor
        instructor?.course = course
        
        course = nil
        instructor = nil
        
        
        var courseWeak: WeakCourse? = WeakCourse(name: "iOS Development")
        var instructorWeak: WeakInstructor? = WeakInstructor(name: "Melik")
        
        // weak refence cycle
        courseWeak?.instructor = instructorWeak
        instructorWeak?.course = courseWeak
        
        courseWeak = nil
        instructorWeak = nil
        

    }




}

