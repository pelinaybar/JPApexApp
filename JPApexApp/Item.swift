//
//  Item.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 7.02.2024.
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
