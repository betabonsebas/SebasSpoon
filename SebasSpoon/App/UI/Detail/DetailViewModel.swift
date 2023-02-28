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
  
  private var recipe: Recipe?
  @Published var isLoading: Bool = false
  var image: URL? {
    return URL(string: recipe?.image ?? "")
  }
  
  var title: String {
    return recipe?.title ?? ""
  }
  
  var instructions: String {
    return recipe?.instructions ?? ""
  }
  
  var ingredients: [ExtendedIngredient] {
    return recipe?.extendedIngredients ?? []
  }
  
  
  init(id: Int, client: Client = NetworkClient()) {
    self.id = id
    self.client = client
    fetchRecipe()
  }
  
  private func fetchRecipe() {
    isLoading = true
    cancellationToken =  client.fetch(api: RecipeAPI.recipeInfo(id: id))?
      .sink(receiveCompletion: { [weak self] completion in
        self?.isLoading = false
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      }, receiveValue: { [weak self] (recipe: Recipe) in
        self?.isLoading = false
        self?.recipe = recipe
      })
  }
}
