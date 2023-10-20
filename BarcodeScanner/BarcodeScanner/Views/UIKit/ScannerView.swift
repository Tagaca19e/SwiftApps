//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/19/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
  @Binding var scannedCode: String
  @Binding var alertItem: AlertItem?

  // Init ScannerViewController.
  func makeUIViewController(context: Context) -> ScannerVC {
    ScannerVC(scannerDelegate: context.coordinator)
  }
  
  func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}

  // Make coordinator -- middle man between a view and a view controller.
  func makeCoordinator() -> Coordinator {
    Coordinator(scannerView: self)
  }

  // This is the Scanner View Controller, that is why its is overriding
  // didFind() and didSurface() functions.
  final class Coordinator: NSObject, ScannerVCDelegate {
    // View to control.
    private let scannerView: ScannerView

    // Connect scanner view with coordinator with init.
    init(scannerView: ScannerView) {
      self.scannerView = scannerView
    }

    // If we found a barcode.
    func didFind(barcode: String) {
      // Set find barcode to the view.
      scannerView.scannedCode = barcode
    }

    // Checker if there is an error.
    func didSurface(error: CameraError) {
      // Check what type of error it is.
      switch error {
        case .invalidDeviceInput:
          scannerView.alertItem = AlertContext.invalidDeviceInput
        case .invalidScannedValue:
          scannerView.alertItem = AlertContext.invalidScannedValue
      }
    }
  }
}
