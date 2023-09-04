//
//  RecipeView.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import SwiftUI
import SwiftData

struct RecipeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Recipe> { $0.headline == "Carbonara" } )
    private var results: [Recipe]
    var recipeId: UUID
    @State var recipe: Recipe?
    @State private var ingredients: [IngredientPivot] = []

    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe?.headline ?? "")
                .font(.headline)
            Text("Serves: \(recipe?.serves ?? 0)")
            List(ingredients) { pivot in
                RecipeIngredientRow(pivot: pivot)
            }
            .listStyle(.plain)
        }
        .padding(.horizontal)
        .onAppear {
            recipe = results.first
            if let pivots = recipe?.pivots {
                self.ingredients = pivots.sorted(by: { $0.sequence < $1.sequence } )
            }
        }
    }
}

#Preview {
    RecipeView(recipeId: UUID(), recipe: nil)
        .modelContainer(recipePreviewContainer)
}
