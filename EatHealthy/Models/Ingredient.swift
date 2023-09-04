//
//  Ingredient.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import Foundation
import SwiftData

@Model
final class Ingredient {
    let id: UUID
    let name: String
    var group: Int = IngredientGroup.other.rawValue
    var alternatives: [Ingredient] = []

    @Relationship(deleteRule: .cascade)
    var pivots: [IngredientPivot] = []

    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

