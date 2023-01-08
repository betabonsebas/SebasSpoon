//
//  Client.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Combine
import Foundation

protocol Client {
  func fetch(api: API) -> AnyPublisher<SearchResult, Error>?
}

class NetworkClient: Client {
  func fetch(api: API) -> AnyPublisher<SearchResult, Error>? {
    do {
      let request = try api.asURLRequest()
      let anyCancellable = URLSession.shared.dataTaskPublisher(for: request)
        .map { $0.data }
        .decode(type: SearchResult.self, decoder: JSONDecoder())
        .mapError({ $0 as Error })
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
      return anyCancellable
    } catch let error {
      print(error.localizedDescription)
      return nil
    }
  }
}
