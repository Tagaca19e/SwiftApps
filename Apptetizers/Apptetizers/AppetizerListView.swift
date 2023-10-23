//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Eidmone Tagaca on 10/20/23.
//

import SwiftUI

struct AppetizerListView: View {
  @StateObject var viewModel = AppetizerListViewModel()

  var body: some View {
    NavigationView {
      // Loop through appetizers and display them.
      List(viewModel.appetizers) { appetizer in
        AppetizerListCell(appetizer: appetizer)
      }
      .navigationTitle("🍟 Appetizers")
    }
    .onAppear {
      // When navigation view appears, this fires the function getAppetizers.
      viewModel.getAppetizers()
    }
  }
}

struct AppetizerListView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerListView()
  }
}
