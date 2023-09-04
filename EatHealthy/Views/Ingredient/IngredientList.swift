//
//  IngredientList.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI
import SwiftData

struct IngredientList: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Query private var ingredients: [Ingredient]

    @State private var isShowingAdd: Bool = false
    @State private var selectedGroup: IngredientGroup = .vegetable

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                IngredientGroupPicker(selectedGroup: $selectedGroup)
                Text(selectedGroup.description.uppercased())
                    .padding()
                FilteredIngredientList(ingredientGroup: selectedGroup)
                    .padding(.horizontal)
                Spacer()
                .navigationTitle("Ingredients")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { isShowingAdd = true }) {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isShowingAdd) {
                    AddIngredient(selectedGroup: $selectedGroup)
                        .padding()
                        .presentationDetents([.fraction(0.25)])
                }
            }
        }
    }
}

#Preview {
    IngredientList()
        .modelContainer(ingredientsPreviewContainer)
}
