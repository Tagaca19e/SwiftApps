//
//  NetworkManager.swift
//  Apptetizers
//
//  Created by Eidmone Tagaca on 10/22/23.
//

import Foundation

final class NetworkManager {
  static let shared = NetworkManager()
  
  static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
  private let appetizerURL = baseURL + "appetizers"

  private init() {}

  func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
    // Check if url is valid and not nil.
    guard let url = URL(string: appetizerURL) else {
      completed(.failure(.invalidURL))
      return
    }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      // Guard for data, response, and error nils and HTTP status codes.
      
      // If there is an error then send unableToComplete.
      if let _ = error {
        completed(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completed(.failure(.invalidData))
        return
      }

      // Decode data when we fetch our data.
      do {
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
        completed(.success(decodedResponse.request))
      } catch {
        completed(.failure(.invalidData))
      }
    }
    task.resume()
  }
}
