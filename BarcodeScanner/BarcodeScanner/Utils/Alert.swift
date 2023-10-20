//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/19/23.
//

import SwiftUI

struct AlertContext {
  static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                            message: "Something is wrong with the camera.",
                                            dismissButton: .default(Text("Ok")))

  static let invalidScannedValue = AlertItem(title: "Invalid Scanned Value",
                                            message: "The value scanned is not valid. App is for EAN-8 and EAN-13",
                                            dismissButton: .default(Text("Ok")))
}
