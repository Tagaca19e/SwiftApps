//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/16/23.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
  var selectedFramework: Framework? {
    // If selected framework is set then change isShowingDetailView to true.
    didSet {
      isShowingDetailView = true
    }
  }
  @Published var isShowingDetailView = false  // Publish if var changes to the view.

  // Two columns for the grid.
  let columns: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())] // Flexible size of grid.
}
