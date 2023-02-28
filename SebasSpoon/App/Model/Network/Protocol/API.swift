//
//  API.swift
//  SebasSpoon
//
//  Created by Sebastian Bonilla on 7/01/23.
//

import Foundation

protocol API {
  var baseURL: String { get }
  var apiKey: String { get }
  var requestMethod: String { get }
  var requestPath: String? { get }
  var requestPathParam: String? { get }
  var queryItems: [URLQueryItem]? { get }
  func asURLRequest() throws -> URLRequest
}

extension API {
  var baseURL: String {
    "https://api.spoonacular.com/"
  }
  
  var apiKey: String {
    "300c1421a82d411badf21df5b7928efe"
  }
  
  func asURLRequest() throws -> URLRequest {
    var urlRequest: URLRequest!
    
    guard var urlComponents = URLComponents(string: baseURL)  else {
      throw NetworkError.badURLError
    }
    
    if let requestPath = requestPath {
      urlComponents.path = requestPath
      if let requestPathParam = requestPathParam {
        urlComponents.path = requestPath + requestPathParam
      }
    }
    
    urlComponents.queryItems = queryItems
    guard let url = urlComponents.url else {
      throw NetworkError.badURLError
    }
    
    urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = requestMethod
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    return urlRequest
  }
}
