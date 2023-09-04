//
//  IngredientGroup.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import Foundation

enum IngredientGroup: Int, Codable, CaseIterable, CustomStringConvertible {
    case vegetable = 0
    case fruit = 1
    case meat = 3
    case fish = 4
    case shellfish = 5
    case legume = 6
    case grain = 7
    case dairy = 8

    var id: Self { self }

    var description: String {
        switch self {
        case .vegetable:
            return "vegetable".localizedString
        case .fruit:
            return "fruit".localizedString
        case .meat:
            return "meat".localizedString
        case .fish:
            return "fish".localizedString
        case .shellfish:
            return "shellfish".localizedString
        case .legume:
            return "legume".localizedString
        case .grain:
            return "grain".localizedString
        case .dairy:
            return "dairy".localizedString
        }
    }
}
