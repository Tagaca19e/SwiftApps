//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/17/23.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  let title: String
  let message: String
  let dismissButton: Alert.Button
}

struct BarcodeScannerView: View {
  // Use observed object when you are getting passed data.
  @StateObject var viewModel = BarcodeScannerViewModel()  // Init new view model.

  var body: some View {
    NavigationView {
      VStack {
        ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
          .frame(maxWidth: .infinity, maxHeight: 300)

        Spacer()
          .frame(height: 60)

        Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
          .font(.title)
        
        Text(viewModel.statusText)
          .bold()
          .font(.largeTitle)
          .foregroundColor(viewModel.statusTextColor)
          .padding()

      }
      .navigationTitle("Barcode Scanner")
      .alert(item: $viewModel.alertItem) { alertItem in
        Alert(title: Text(alertItem.title),
              message: Text(alertItem.message),
              dismissButton: alertItem.dismissButton)
        
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    BarcodeScannerView()
  }
}
