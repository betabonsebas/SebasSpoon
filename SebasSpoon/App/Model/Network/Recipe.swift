//
//  Recipe.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Foundation

struct Recipe: Decodable {
  var id: Int
  var title: String
  var image: String
  var imageType: String
}
