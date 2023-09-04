//
//  RecipeIngredientRow.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI

struct RecipeIngredientRow: View {
    var info: IngredientInfo
    @State private var isShowingAlternatives: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(info.name)
                Spacer()
                if info.quantity > 0 {
                    Text("\(info.quantity) \(info.measurement)")
                } else {
                    Text(info.measurement)
                }
            }
        }
    }
}

#Preview {
    RecipeIngredientRow(info: IngredientInfo(id: UUID(),
                                             sequence: 0,
                                             name: "Bannana",
                                             quantity: 3,
                                             measurement: " "))
        .modelContainer(recipePreviewContainer)
}
