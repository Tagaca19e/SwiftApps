//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/18/23.
//

import UIKit
import AVFoundation

// List of commands no code body... just like prototypes in C++.
protocol ScannerVCDelegate: class {
  func didFind(barcode: String)
}

final class ScannerVC: UIViewController {
  let captureSession = AVCaptureSession()
  var previewLayer: AVCaptureVideoPreviewLayer?  // Displayed on the screen from the camera source.
  weak var scannerDelegate: ScannerVCDelegate?   // Variables that are initialized.
  
  init(scannerDelegate: ScannerVCDelegate) {
    super.init(nibName: nil, bundle: nil)
    self.scannerDelegate = scannerDelegate
  }
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
  private func setupCaptureSession() {
    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
      // Return if there is an error.
      return
    }
    
    let videoInput: AVCaptureDeviceInput
    
    do {
      try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      return  // Catch error later.
    }
    
    if captureSession.canAddInput(videoInput) {
      captureSession.addInput(videoInput)
    } else {
      return
    }
    
    let metaDataOutput = AVCaptureMetadataOutput()
    
    if captureSession.canAddOutput(metaDataOutput) {
      captureSession.addOutput(metaDataOutput)
      metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
      metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
    } else {
      return
    }
    
    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer!.videoGravity = .resizeAspectFill  // Fill the view and keep aspect ratio.
    view.layer.addSublayer(previewLayer!)
    
    captureSession.startRunning()
  }
}


extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
  
}
