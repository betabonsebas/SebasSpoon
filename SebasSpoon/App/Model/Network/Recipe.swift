//
//  Recipe.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Foundation

struct Recipe: Decodable, Hashable {
  static func == (lhs: Recipe, rhs: Recipe) -> Bool {
    lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(title)
  }

  let vegetarian: Bool?
  let vegan: Bool?
  let glutenFree: Bool?
  let dairyFree: Bool?
  let veryHealthy: Bool?
  let cheap: Bool?
  let veryPopular: Bool?
  let sustainable: Bool?
  let lowFodmap: Bool?
  let weightWatcherSmartPoints: Int?
  let gaps: String?
  let preparationMinutes: Int?
  let cookingMinutes: Int?
  let aggregateLikes: Int?
  let healthScore: Int?
  let creditsText: String?
  let license: String?
  let sourceName: String?
  let pricePerServing: Double?
  let extendedIngredients: [ExtendedIngredient]?
  let id: Int
  let title: String
  let readyInMinutes: Int?
  let servings: Int?
  let sourceURL: String?
  let image: String
  let imageType: String
  let summary: String?
//  let winePairing: WinePairing?
  let instructions: String?
//  let analyzedInstructions: [AnalyzedInstruction]?
  let spoonacularSourceURL: String?
}

struct AnalyzedInstruction: Decodable {
  let name: String
  let steps: [Step]
}

struct Step: Decodable {
  let number: Int
  let step: String
  let ingredients: [Ent]
  let equipment: [Ent]
  let length: Length?
}

struct Ent: Decodable {
  let id: Int
  let name: String
  let localizedName: String
  let image: String
}

struct Length: Decodable {
  let number: Int
  let unit: String
}

struct ExtendedIngredient: Decodable {
  let id: Int
  let aisle: String
  let image: String
//  let consistency: Consistency
  let name: String
  let nameClean: String
  let original: String
  let originalName: String
  let amount: Double
  let unit: String
//  let meta: [String]
  let measures: Measures
}

enum Consistency: Decodable {
  case liquid
  case solid
}

struct Measures: Decodable {
  let us: Metric
  let metric: Metric
}

struct Metric: Decodable {
  let amount: Double
  let unitShort: String
  let unitLong: String
}

struct WinePairing: Decodable {
  let pairedWines: [String]
  let pairingText: String
  let productMatches: [ProductMatch]
}

struct ProductMatch: Decodable {
  let id: Int
  let title: String
  let productMatchDescription: String
  let price: String
  let imageURL: String
  let averageRating: Double
  let ratingCount: Double
  let score: Double
  let link: String
}
