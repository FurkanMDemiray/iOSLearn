//
//  Item.swift
//  TGYSwiftUI
//
//  Created by Melik Demiray on 29.04.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
