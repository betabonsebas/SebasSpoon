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
            Image("recipe")
              .imageScale(.large)
              .foregroundColor(.accentColor)
            Text(recipe.title)
          }
        }
      }
      .navigationDestination(for: Recipe.self, destination: { recipe in
        viewModel.showDetail(recipe: recipe)
      })
      .navigationTitle("Recipes")
    }
  }
}

struct RecipesViewr_Previews: PreviewProvider {
  static var previews: some View {
    RecipesView()
  }
}
