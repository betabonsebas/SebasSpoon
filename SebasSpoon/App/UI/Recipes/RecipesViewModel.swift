//
//  RecipesViewModel.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 8/01/23.
//

import Combine
import Foundation

class RecipesViewModel: ObservableObject {
  
  
  private var cancellationToken: AnyCancellable?
  private let client: Client
  
  @Published var recipes: [Recipe] = []
  
  init(client: Client = NetworkClient()) {
    self.client = client
    fetchRecipes()
  }
  
  func fetchRecipes() {
    cancellationToken = client.fetch(api: RecipeAPI.searchRecipes)?
      .map(\.results)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      }, receiveValue: { recipes in
        self.recipes = recipes
      })
  }
}
