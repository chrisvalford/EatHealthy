//
//  RecipePreview.swift
//  EatHealthy
//
//  Created by Christopher Alford on 2/9/23.
//

import Foundation
import SwiftData

@MainActor
let recipesPreviewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Recipe.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        Task { @MainActor in
            let context = container.mainContext
            let recipe1 = Recipe(headline: "Carbonara")
            context.insert(recipe1)

            let recipe2 = Recipe(headline: "Broccoli and anchovy pasta")
            context.insert(recipe2)

//            var transactions: [Transaction] = []
//            for i in 0..<19 {
//                let value = randomAmount()
//                let tx = Transaction(note: randomTxType(forValue: value), amount: value, date: TXDate(), hasReceipt: false)
//                transactions.append(tx)
//            }
//            account.transactions = transactions
        }

        return container

    } catch {
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }
}()

