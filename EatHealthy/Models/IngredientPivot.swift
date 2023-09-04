//
//  IngredientPivot.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import Foundation
import SwiftData

@Model
final class IngredientPivot {
    let sequence: Int
    let quantity: Int
    let measurement: String
    var alternatives: [Ingredient] = []

    @Relationship(inverse: \Recipe.pivots)
    var recipe: Recipe?

    @Relationship(inverse: \Ingredient.pivots)
    var ingredient: Ingredient?

    init(sequence: Int, quantity: Int, measurement: String) {
        self.sequence = sequence
        self.quantity = quantity
        self.measurement = measurement
    }

    init(recipe: Recipe,
         ingredient: Ingredient,
         sequence: Int,
         quantity: Int,
         measurement: String) {
        self.recipe = recipe
        self.ingredient = ingredient
        self.sequence = sequence
        self.quantity = quantity
        self.measurement = measurement
    }
}
