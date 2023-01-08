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
  }
  
  case searchRecipes
  
  var requestMethod: String {
    "GET"
  }
  
  var requestPath: String? {
    "/recipes/complexSearch"
  }
  
  var requestPathParam: String? {
    nil
  }
  
  var queryItems: [URLQueryItem]? {
    [
      URLQueryItem(name: Constants.apiKeyName, value: apiKey),
      URLQueryItem(name: Constants.numberName, value: "100")
    ]
  }
}
