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
    @State private var ingredientInfos: [IngredientInfo] = []

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(recipe?.headline ?? "")
                    .font(.headline)
                Text("Serves: \(recipe?.serves ?? 0)")
                List(ingredientInfos, children: \.alternatives) { info in
                    RecipeIngredientRow(info: info)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .padding(.horizontal)
            .onAppear {
                buildData()
            }
            .navigationTitle("Quick recipe")
        }
    }

    /**
     * Transform the Recipe <-> Ingredient pivots into a format suitable for a list with children
     */
    func buildData() {
        // The data is returned as an array of Recipe
        // We only want the first
        guard let recipe = results.first else {
            return
        }
        self.recipe = recipe
        // Sort by sequence attribute
        let pivots = recipe.pivots.sorted(by: { $0.sequence < $1.sequence } )

        // Loop through the pivots adding ingredient data
        for pivot in pivots {
            // Loop through the ingredients looking for alternatives
            var alternatives: [IngredientInfo]?
            for alternative in pivot.alternatives {
                if alternatives == nil {
                    alternatives = [IngredientInfo]()
                }
                alternatives?.append(IngredientInfo(id: UUID(),
                                                        sequence: 0,
                                                        name: alternative.name,
                                                        quantity: 0,
                                                        measurement: ""))
            }
            let info = IngredientInfo(id: pivot.ingredient?.id ?? UUID(),
                                      sequence: pivot.sequence,
                                      name: pivot.ingredient?.name ?? "",
                                      quantity: pivot.quantity,
                                      measurement: pivot.measurement,
                                      alternatives: alternatives)
            ingredientInfos.append(info)
        }
    }
}

#Preview {
    RecipeView(recipeId: UUID(), recipe: nil)
        .modelContainer(recipePreviewContainer)
}


