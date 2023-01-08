//
//  RecipesView.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import SwiftUI

struct RecipesView: View {
  @State var recipes: [Recipe] = [
    Recipe(id: 0, title: "Recipe 1", image: "", imageType: ""),
    Recipe(id: 1, title: "Recipe 2", image: "", imageType: ""),
    Recipe(id: 2, title: "Recipe 3", image: "", imageType: ""),
    Recipe(id: 3, title: "Recipe 4", image: "", imageType: "")
  ]
  
  @ObservedObject var viewModel = RecipesViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        List(viewModel.recipes, id: \.id) { recipe in
          HStack{
            Image(systemName: "globe")
              .imageScale(.large)
              .foregroundColor(.accentColor)
            Text(recipe.title)
          }
        }
      }
      .padding()
    }
    .navigationTitle("Recipes")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RecipesView()
  }
}
