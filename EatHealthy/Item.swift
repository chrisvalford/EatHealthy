//
//  Item.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
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
