//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/16/23.
//

import SwiftUI

struct FrameworkDetailView: View {
  var framework: Framework
  @Binding var isShowingDetailView: Bool
  @State private var isShowingSafariView = false
  
  var body: some View {
    VStack {
      DismissButton(isShowingDetailView: $isShowingDetailView)
      Spacer()

      FrameworkTitleView(framework: framework)

      Text(framework.description)
        .font(.body)
        .padding()

      Spacer()

      Button {
        // Action
        isShowingSafariView = true
      } label: {
        AFButton(text: "Learn More")
      }
    }
    .sheet(isPresented: $isShowingSafariView, content: {
      // Handle error handling and redirect to apple website.
      SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
    })
  }
}

struct FrameworkDetailView_Previews: PreviewProvider {
  static var previews: some View {
    // Hardcode constants for previews.
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
  }
}
