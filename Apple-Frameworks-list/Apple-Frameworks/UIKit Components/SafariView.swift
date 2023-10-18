//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/17/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
  var url: URL

  // Create view controller.
  func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->
    SFSafariViewController {
    SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: SFSafariViewController,
                              context: UIViewControllerRepresentableContext<SafariView>) {}
}
