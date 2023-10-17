//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Eidmone Tagaca on 10/16/23.
//

import SwiftUI

// Make View more reusable and separated from main view.
struct WeatherButton: View {
  var title: String
  var textColor: Color
  var backgroundColor: Color
  
  var body: some View {
    Text(title)
      .frame(width: 280, height: 50)
      .background(backgroundColor.gradient)
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .bold, design: .default))
      .cornerRadius(10)
  }
}

