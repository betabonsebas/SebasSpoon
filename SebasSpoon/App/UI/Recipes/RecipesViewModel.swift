//
//  RecipesViewModel.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 8/01/23.
//

import Combine
import Foundation
import SwiftUI

class RecipesViewModel: ObservableObject {
  
  private var subscriptions: Set<AnyCancellable> = []
//  private var cancellationToken: AnyCancellable?
  private let client: Client
  
  @Published var recipes: [Recipe] = []
  @Published var searchText: String = String()
  
  init(client: Client = NetworkClient()) {
    self.client = client
    fetchRecipes()
    $searchText
      .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
      .removeDuplicates()
      .compactMap { $0 }
      .sink { (_) in
        
      } receiveValue: { [weak self] searchField in
        self?.fetchRecipes(search: searchField)
      }
      .store(in: &subscriptions)
  }
  
  func fetchRecipes(search: String = "") {
    client.fetch(api: RecipeAPI.searchRecipes(query: search))?
      .map({ (result: SearchResult) in
        result.results
      })
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
      .store(in: &subscriptions)
  }
  
  func showDetail(recipe: Recipe) -> some View {
    let viewModel = DetailViewModel(id: recipe.id)
    return DetailView(viewModel: viewModel)
  }
}
