//
//  HomeView.swift
//  EatHealthy
//
//  Created by Christopher Alford on 4/9/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Ingredients", destination: IngredientList())
        }
    }
}

#Preview {
    HomeView()
}
