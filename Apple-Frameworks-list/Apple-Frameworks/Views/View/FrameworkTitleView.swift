//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/17/23.
//

import SwiftUI

struct FrameworkTitleView: View {
  var framework: Framework

  var body: some View {
    VStack {
      Image(framework.imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 90, height: 90)
      
      Text(framework.name)
        .font(.headline)
        .fontWeight(.semibold)
        .scaledToFit()
        .minimumScaleFactor(0.6)  // Text can shrink but to a minimum.
    }
    .padding()
  }
}

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
      FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
