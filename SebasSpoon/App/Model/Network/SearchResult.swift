//
//  SearchResult.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Foundation

struct SearchResult: Decodable {
  var results: [Recipe]
  var offset: Int
  var number: Int
  var totalResults: Int
}
