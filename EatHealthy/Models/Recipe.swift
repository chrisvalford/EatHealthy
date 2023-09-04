//
//  Recipe.swift
//  EatHealthy
//
//  Created by Christopher Alford on 3/9/23.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    let id: UUID
    var headline: String
    var subheadline: String?
    var body: String?
    let created: Date
    var serves: Int = 2
    var rating: Int = 3

    @Relationship(deleteRule: .cascade)
    var pivots: [IngredientPivot] = []
    
    init(headline: String) {
        self.id = UUID()
        self.headline = headline
        self.created = Date()
    }
}
