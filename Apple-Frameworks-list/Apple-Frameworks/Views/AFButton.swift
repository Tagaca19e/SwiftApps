//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/16/23.
//

import SwiftUI

struct AFButton: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.title2)
      .fontWeight(.semibold)
      .frame(width: 280, height: 50)
      .background(Color.red.gradient)
      .cornerRadius(10)
      .foregroundColor(.white)
  }
}

struct AFButton_Previews: PreviewProvider {
  static var previews: some View {
    AFButton(text: "Learn more")
  }
}
