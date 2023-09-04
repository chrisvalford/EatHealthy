//
//  FilteredIngredientList.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI

import SwiftUI
import SwiftData

struct FilteredIngredientList: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Query private var ingredients: [Ingredient] = []

    init(ingredientGroup: IngredientGroup?) {
        guard let group = ingredientGroup else {
            _ingredients = Query()
            return
        }
        _ingredients = Query(filter: #Predicate<Ingredient> { $0.group == group.rawValue }, sort: [SortDescriptor(\Ingredient.name)] )
    }

    var body: some View {
        VStack {
            List {
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                    }
                }
                .onDelete(perform: deleteItems)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(ingredients[index])
            }
        }
    }
}

//#Preview {
//    FilteredIngredientList()
//        .modelContainer(ingredientsPreviewContainer)
//}

