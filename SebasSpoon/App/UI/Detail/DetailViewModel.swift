//
//  DetailViewModel.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 9/01/23.
//

import Combine
import Foundation

class DetailViewModel: ObservableObject {
  private var cancellationToken: AnyCancellable?
  private let client: Client
  private var id: Int
  
  @Published var recipe: Recipe?
  
  init(id: Int, client: Client = NetworkClient()) {
    self.id = id
    self.client = client
    fetchRecipe()
  }
  
  private func fetchRecipe() {
    cancellationToken =  client.fetch(api: RecipeAPI.recipeInfo(id: id))?
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      }, receiveValue: { (recipe: Recipe) in
        self.recipe = recipe
      })
  }
}
