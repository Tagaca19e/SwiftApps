//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Eidmone Tagaca on 10/18/23.
//

import UIKit
import AVFoundation

enum CameraError: String {
  case invalidDeviceInput
  case invalidScannedValue
}

// List of commands no code body... just like prototypes in C++.
protocol ScannerVCDelegate: AnyObject {
  func didFind(barcode: String)        // Gets the barcode string.
  func didSurface(error: CameraError)  // Puts up the error message.
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCaptureSession()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    guard let previewLayer = previewLayer else {
      scannerDelegate?.didSurface(error: .invalidDeviceInput)
      return
    }

    previewLayer.frame = view.layer.bounds
  }
  
  private func setupCaptureSession() {
    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
      scannerDelegate?.didSurface(error: .invalidDeviceInput)
      // Return if there is an error.
      return
    }
    
    let videoInput: AVCaptureDeviceInput
    
    do {
      try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      scannerDelegate?.didSurface(error: .invalidDeviceInput)
      return  // Catch error later.
    }
    
    if captureSession.canAddInput(videoInput) {
      captureSession.addInput(videoInput)
    } else {
      scannerDelegate?.didSurface(error: .invalidDeviceInput)
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
  func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
    // Check if there is a metadata object.
    guard let object = metadataObjects.first else {
      scannerDelegate?.didSurface(error: .invalidScannedValue)
      return
    }

    // Check if AVMetadataMachineReadableCodeObject.
    guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
      scannerDelegate?.didSurface(error: .invalidScannedValue)
      return
    }

    // Get string value.
    guard let barcode = machineReadableObject.stringValue else {
      scannerDelegate?.didSurface(error: .invalidScannedValue)
      return
    }

    // Send it to delegate.
    scannerDelegate?.didFind(barcode: barcode)
  }
}
