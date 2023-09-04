//
//  IngredientGroup.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import Foundation
import SwiftUI

enum IngredientGroup: Int, Codable, CaseIterable, CustomStringConvertible {
    case vegetable = 0
    case fruit = 1
    case meat = 3
    case fish = 4
    case shellfish = 5
    case legume = 6
    case grain = 7
    case dairy = 8
    case spice = 9
    case other = 10

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
        case .spice:
            return "spice".localizedString
        case .other:
            return "other".localizedString

        }
    }

    var text: String {
        switch self {
        case .vegetable:
            return "vegetables".localizedString
        case .fruit:
            return "fruits".localizedString
        case .meat:
            return "meat cuts".localizedString
        case .fish:
            return "fishes and cuts".localizedString
        case .shellfish:
            return "shellfish".localizedString
        case .legume:
            return "legumes and beans".localizedString
        case .grain:
            return "grains".localizedString
        case .dairy:
            return "dairy products".localizedString
        case .spice:
            return "herbs and spices".localizedString
        case .other:
            return "everything else".localizedString

        }
    }

    var icon: Image {
        switch self {
        case .vegetable:
            return Image("icon.vegetable")
        case .fruit:
            return Image("icon.fruit")
        case .meat:
            return Image("icon.meat")
        case .fish:
            return Image("icon.fish")
        case .shellfish:
            return Image("icon.shellfish")
        case .legume:
            return Image("icon.legume")
        case .grain:
            return Image("icon.grain")
        case .dairy:
            return Image("icon.dairy")
        case .spice:
            return Image("icon.grain")
        case .other:
            return Image("icon.grain")
        }
    }
}
