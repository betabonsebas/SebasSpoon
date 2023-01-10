//
//  DetailView.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 9/01/23.
//

import SwiftUI

struct DetailView: View {
  @ObservedObject var viewModel: DetailViewModel
    var body: some View {
      VStack(alignment: .leading, spacing: 24) {
        VStack(spacing: 16) {
          Text(viewModel.recipe?.title ?? "")
            .font(.largeTitle)
          Text("Instructions")
            .font(.headline)
          Text(viewModel.recipe?.instructions ?? "")
            .font(.body)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        Text("Ingredients")
          .font(.headline)
        List(viewModel.recipe?.extendedIngredients ?? [], id:\.id) { ingredient in
          Text(ingredient.name)
            .font(.body)
        }
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView(viewModel: DetailViewModel(id: 716426))
    }
}
