//
//  RecipeAPI.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Foundation

enum RecipeAPI: API {
  struct Constants {
    static let apiKeyName = "apiKey"
    static let numberName = "number"
    static let query = "query"
  }
  
  case searchRecipes(query: String)
  case recipeInfo(id: Int)
  
  var requestMethod: String {
    "GET"
  }
  
  var requestPath: String? {
    switch self {
    case .searchRecipes:
      return "/recipes/complexSearch"
    case .recipeInfo(let id):
      return "/recipes/\(id)/information"
    }
    
  }
  
  var requestPathParam: String? {
    nil
  }
  
  var queryItems: [URLQueryItem]? {
    var items: [URLQueryItem] = []
    items.append(URLQueryItem(name: Constants.apiKeyName, value: apiKey))
    switch self {
    case .searchRecipes(let query):
      if !query.isEmpty {
        items.append(URLQueryItem(name: Constants.query, value: query))
      }
      items.append(URLQueryItem(name: Constants.numberName, value: "100"))
    case .recipeInfo:
      items.append(URLQueryItem(name: "includeNutrition", value: "false"))
    }
    return items
  }
}
