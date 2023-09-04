//
//  RecipesList.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import SwiftUI
import SwiftData

struct RecipesList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeView(recipeId: recipe.id)
                    } label: {
                        Text(recipe.headline)
                    }
                }
            }
            .navigationTitle("Recipes")
        } detail: {
            Text("Choose a recipe")
        }
    }
}

#Preview {
    RecipesList()
        .modelContainer(recipesPreviewContainer)
}
