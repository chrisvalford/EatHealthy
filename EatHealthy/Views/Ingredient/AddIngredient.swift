//
//  AddIngredient.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI

struct AddIngredient: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @Binding var selectedGroup: IngredientGroup

    var body: some View {
        VStack {
            Text("Add a new ingredient")
            TextField("name".localizedString, text: $name)
                .keyboardType(.default)
                .textInputAutocapitalization(.sentences)
            IngredientGroupPicker(selectedGroup: $selectedGroup)
            Spacer()
            Button("Add") {
                addIngredient()
            }
        }
    }

    func addIngredient() {
        if name.count < 3 { return }
        let ingredient = Ingredient(name: name)
        ingredient.group = selectedGroup.rawValue
        modelContext.insert(ingredient)
        presentationMode.wrappedValue.dismiss()
    }
}

//#Preview {
//    AddIngredient(selectedGroup: IngredientGroup.fish)
//}
