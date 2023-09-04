//
//  RecipePrieview.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import Foundation
import SwiftData

@MainActor
let recipePreviewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: IngredientPivot.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        Task { @MainActor in
            let context = container.mainContext
            
            let recipe = Recipe(headline: "Carbonara")
            context.insert(recipe)

            let pivot1 = IngredientPivot(sequence: 3, quantity: 2, measurement: "Cloves")
            context.insert(pivot1)
            pivot1.recipe = recipe
            let ingredient1 = Ingredient(name: "Garlic")
            ingredient1.group = .vegetable
            context.insert(ingredient1)
            pivot1.ingredient = ingredient1

            let pivot2 = IngredientPivot(sequence: 1, quantity: 25, measurement: "g")
            pivot2.recipe = recipe
            let ingredient2 = Ingredient(name: "Pancetta")
            ingredient2.group = .meat
            context.insert(ingredient2)
            pivot2.ingredient = ingredient2
            let altIngredient2a = Ingredient(name: "Smoked Bacon")
            context.insert(altIngredient2a)
            pivot2.alternatives.append(altIngredient2a)
            let altIngredient2b = Ingredient(name: "Lardons")
            context.insert(altIngredient2b)
            pivot2.alternatives.append(altIngredient2b)
            context.insert(pivot2)

            let pivot3 = IngredientPivot(sequence: 2, quantity: 12, measurement: "g")
            context.insert(pivot3)
            pivot3.recipe = recipe
            let ingredient3 = Ingredient(name: "Pecorino Romano")
            ingredient3.group = .dairy
            context.insert(ingredient3)
            pivot3.ingredient = ingredient3

            let pivot4 = IngredientPivot(sequence: 4, quantity: 1, measurement: "")
            context.insert(pivot4)
            pivot4.recipe = recipe
            let ingredient4 = Ingredient(name: "Fresh eggs")
            context.insert(ingredient4)
            pivot4.ingredient = ingredient4

            let pivot5 = IngredientPivot(sequence: 5, quantity: 0, measurement: "To taste")
            context.insert(pivot5)
            pivot5.recipe = recipe
            let ingredient5 = Ingredient(name: "Ground black pepper")
            context.insert(ingredient5)
            pivot5.ingredient = ingredient5

            let pivot6 = IngredientPivot(sequence: 6, quantity: 200, measurement: "g")
            context.insert(pivot6)
            pivot6.recipe = recipe
            let ingredient6 = Ingredient(name: "Pasta")
            context.insert(ingredient6)
            pivot6.ingredient = ingredient6

        }
        return container

    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()
