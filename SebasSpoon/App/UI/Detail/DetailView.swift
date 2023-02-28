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
    if (viewModel.isLoading) {
      VStack {
        ProgressView()
      }
    }else {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          GeometryReader { proxy in
            AsyncImage(url: viewModel.image)
              .frame(width: proxy.size.width, height: 200)
              .aspectRatio(contentMode: .fit)
              .clipped()
          }
          .frame(height: 200)
          VStack(spacing: 16) {
            Text("Instructions")
              .font(.headline)
            Text(viewModel.instructions)
              .font(.body)
          }
          .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
          VStack (alignment: .center) {
            Text("Ingredients")
              .font(.headline)
          }
          .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
          ForEach(viewModel.ingredients, id: \.id) { ingredient in
            Text(ingredient.name)
              .font(.body)
              .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
          }
        }
      }
      .navigationTitle(viewModel.title)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(viewModel: DetailViewModel(id: 716426))
  }
}
