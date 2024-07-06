//
//  Birds.swift
//  CrayzBirds
//
//  Created by Melik Demiray on 25.03.2024.
//

import Foundation

struct Bullet {
    var velocity: Double
    var angle: Double

    mutating func distance() -> Double {
        return (pow(velocity, 2) * sin(2 * angle)) / 10
    }
}
