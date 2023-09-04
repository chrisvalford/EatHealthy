//
//  RecipeIngredientRow.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI

struct RecipeIngredientRow: View {
    var pivot: IngredientPivot
    @State private var isShowingAlternatives: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if pivot.alternatives.count > 0 {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(pivot.ingredient?.name ?? "")
                            Button {
                                isShowingAlternatives.toggle()
                            } label: {
                                Image(systemName: isShowingAlternatives ? "chevron.up.circle" : "chevron.down.circle")
                            }
                        }
                        if isShowingAlternatives {
                            List {
                                Text("Alternative1")
                                Text("Alternative3")
                            }
                        }
                    }
                } else {
                    Text(pivot.ingredient?.name ?? "")
                }
                Spacer()
                if pivot.quantity > 0 {
                    Text("\(pivot.quantity) \(pivot.measurement)")
                } else {
                    Text(pivot.measurement)
                }
            }
        }
        .frame(height: CGFloat(pivot.alternatives.count * 32))
    }
}

//#Preview {
//    RecipeIngredientRow()
//        .modelContainer(recipePreviewContainer)
//}
