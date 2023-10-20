//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/19/23.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
  // Publish events to view.
  @Published var scannedCode: String = ""
  @Published var alertItem: AlertItem?

  var statusText: String {
    scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
  }

  var statusTextColor: Color {
    scannedCode.isEmpty ? .red : .green
  }
}
