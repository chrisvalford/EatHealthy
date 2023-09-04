//
//  IngredientGroupPicker.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI
import SwiftData

struct IngredientGroupPicker: View {
    @Binding var selectedGroup: IngredientGroup

    var body: some View {
        Picker("",
               selection: $selectedGroup
        ) {
            ForEach(IngredientGroup.allCases, id: \.self) { option in
                option.icon
            }
        }
        .pickerStyle(.segmented)
    }
}

//#Preview {
//    IngredientGroupPicker()
//}
