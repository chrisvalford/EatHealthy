//
//  IngredientsPreview.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import Foundation
import SwiftData

@MainActor
let ingredientsPreviewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Ingredient.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        Task { @MainActor in
            let context = container.mainContext

            let ingredient1 = Ingredient(name: "Garlic")
            ingredient1.group = IngredientGroup.vegetable.rawValue
            context.insert(ingredient1)

            let ingredient2 = Ingredient(name: "Pancetta")
            ingredient2.group = IngredientGroup.meat.rawValue
            context.insert(ingredient2)

            let ingredient2a = Ingredient(name: "Smoked Bacon")
            ingredient2a.group = IngredientGroup.meat.rawValue
            context.insert(ingredient2a)

            let ingredient2b = Ingredient(name: "Lardons")
            ingredient2b.group = IngredientGroup.meat.rawValue
            context.insert(ingredient2b)

            let ingredient3 = Ingredient(name: "Pecorino Romano")
            ingredient3.group = IngredientGroup.dairy.rawValue
            context.insert(ingredient3)

            let ingredient4 = Ingredient(name: "Fresh eggs")
            ingredient4.group = IngredientGroup.vegetable.rawValue
            context.insert(ingredient4)

            let ingredient5 = Ingredient(name: "Ground black pepper")
            ingredient5.group = IngredientGroup.spice.rawValue
            context.insert(ingredient5)

            let ingredient6 = Ingredient(name: "Pasta")
            ingredient6.group = IngredientGroup.other.rawValue
            context.insert(ingredient6)

        }
        return container

    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()
