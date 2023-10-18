//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Eidmone Tagaca on 10/16/23.
//

import SwiftUI

struct FrameworkGridView: View {
  // Use our viewModel. Use StateObject when you first initialize viewModel
  // but when getting viewModel from another view, initialize viewModel then
  // use ObservableObject. StateObject retains it's state even view is destroyed.
  @StateObject var viewModel = FrameworkGridViewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: viewModel.columns) {
          // Data needs to be hashable.
          ForEach(MockData.frameworks) { framework in
            FrameworkTitleView(framework: framework)
              .onTapGesture {
                // Change framework to display.
                viewModel.selectedFramework = framework
              }
          }
        }
      }
      .navigationTitle("🚀 Frameworks")
      .sheet(isPresented: $viewModel.isShowingDetailView) {
        // Listening if the selectedFramework bool is set to true, passing isShowingDetailView
        // since we need to change it, binded since we need to atomically change it.
        FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                            isShowingDetailView: $viewModel.isShowingDetailView)
      }
    }
  }
}

struct FrameworkGridView_Previews: PreviewProvider {
  static var previews: some View {
    FrameworkGridView()
      .preferredColorScheme(.dark)
  }
}
