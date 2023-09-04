//
//  IngredientInfo.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import Foundation

/**
 * Consolidates Pivot and Ingredient data into a form suitable for a List with children
 */
struct IngredientInfo: Identifiable {
    let id: UUID
    let sequence: Int
    let name: String
    let quantity: Int
    let measurement: String
    var alternatives: [IngredientInfo]?
    var count: Int {
        return alternatives?.count ?? -1
    }
}
