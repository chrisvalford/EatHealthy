//
//  EatHealthyApp.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import SwiftUI
import SwiftData

@main
struct EatHealthyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, Recipe.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            IngredientList()
        }
        .modelContainer(sharedModelContainer)
    }
}
