//
//  IngredientDetail.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI
import SwiftData

struct IngredientDetail: View {
    @Environment(\.modelContext) private var modelContext
    
    var ingredient: Ingredient

    @State private var selectedGroup: IngredientGroup
    @State private var name: String = ""
    @State private var needsSaving: Bool = false

    init(ingredient: Ingredient) {
        self.ingredient = ingredient
        self.name = ingredient.name
        self.selectedGroup = IngredientGroup(rawValue: ingredient.group)!
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("ingredient.name".localizedString)
            TextField("name".localizedString, text: $name)
                .keyboardType(.default)
                .textInputAutocapitalization(.sentences)
            Picker("In group",
                   selection: $selectedGroup
            ) {
                ForEach(IngredientGroup.allCases, id: \.self) { option in
                    Text(option.text.localizedString)
                }
            }
            .tint(.black)
            Spacer()
            Button("Update") {
                update()
            }
            .disabled(!needsSaving)
        }
        .padding(.horizontal)
        .onChange(of: name) { needsSaving = true }
        .onChange(of: selectedGroup) { needsSaving = true }
    }

    func update() {
        if name.count < 3 { return }
        ingredient.name = name
        ingredient.group = selectedGroup.rawValue
        do {
            try modelContext.save()
        } catch {
            print("Couldn't save updated ingredient!")
        }
    }
}

//#Preview {
//    IngredientDetail()
//}
