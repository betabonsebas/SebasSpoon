//
//  RecipesView.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import SwiftUI

struct RecipesView: View {
  @ObservedObject var viewModel = RecipesViewModel()
  
  var body: some View {
    NavigationStack {
      List(viewModel.recipes, id: \.id) { recipe in
        NavigationLink(value: recipe) {
          HStack{
            AsyncImage(url: URL(string: recipe.image))
              .frame(width: 60, height: 60)
              .clipped()
            Text(recipe.title)
          }
        }
      }
      .navigationDestination(for: Recipe.self, destination: { recipe in
        viewModel.showDetail(recipe: recipe)
      })
      .searchable(text: $viewModel.searchText)
      .navigationTitle("Recipes")
    }
  }
}

struct RecipesViewr_Previews: PreviewProvider {
  static var previews: some View {
    RecipesView()
  }
}
