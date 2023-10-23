//
//  Appetizer.swift
//  Apptetizers
//
//  Created by Eidmone Tagaca on 10/20/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let imageURL: String
  let calories: Int
  let protein: Int
  let carbs: Int
}

struct AppetizerResponse: Decodable {
  let request: [Appetizer]
}

struct MockData {
  static let sampleAppetizer = Appetizer(id: 0001,
                                         name: "Test Appetizer",
                                         description: "This is the description",
                                         price: 11, imageURL: "",
                                         calories: 99,
                                         protein: 20,
                                         carbs: 20)
  static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}

// https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers
