//
//  FoodScanningViewModel.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI
import AVFoundation

enum ZoomLevel: String {
    case oneX = "1x"
    case twoX = "2x"
    case fiveX = "5x"
    
    mutating func toggle() {
        switch self {
        case .oneX:
            self = .twoX
        case .twoX:
            self = .fiveX
        case .fiveX:
            self = .oneX
        }
    }
    
    var factor: CGFloat {
            switch self {
            case .oneX: return 1.0
            case .twoX: return 2.0
            case .fiveX: return 5.0
        }
    }
}

struct CapturedPhoto: Identifiable {
    let id = UUID()
    let image: UIImage
}

class FoodScanningViewModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    let session = AVCaptureSession()
    private let output = AVCapturePhotoOutput()
    private var device: AVCaptureDevice?
    private let sessionQueue = DispatchQueue(label: "camera.session.queue")
    
    @Published var capturedPhoto: CapturedPhoto?
    @Published var zoomLevel: ZoomLevel = .oneX
    @Published var flashOn: Bool = false
    
    override init() {
        super.init()
        configureSession()
    }
    
    func startSession() {
        sessionQueue.async {
            if !self.session.isRunning {
                self.session.startRunning()
            }
        }
    }
    
    private func configureSession() {
        session.beginConfiguration()
        session.sessionPreset = .photo
        
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: camera),
              session.canAddInput(input) else {
            print("Failed to add camera input")
            return
        }
        
        device = camera
        session.addInput(input)
        
        guard session.canAddOutput(output) else {
            print("Failed to add photo output")
            return
        }
        
        session.addOutput(output)
        output.isHighResolutionCaptureEnabled = true
        
        session.commitConfiguration()
        sessionQueue.async {
            self.session.startRunning()
        }
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        settings.isHighResolutionPhotoEnabled = true
        settings.flashMode = flashOn ? .on : .off
        
        output.capturePhoto(with: settings, delegate: self)
    }
    
    func toggleZoom() {
        zoomLevel.toggle()
        guard let device = device else { return }
        
        do {
            try device.lockForConfiguration()
            device.videoZoomFactor = min(device.activeFormat.videoMaxZoomFactor, zoomLevel.factor)
            device.unlockForConfiguration()
        } catch {
            print("Zoom configuration failed: \(error)")
        }
    }
    
    func toggleFlash() {
        flashOn.toggle()
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
           guard let data = photo.fileDataRepresentation(),
                 let image = UIImage(data: data) else {
               print("Could not get photo data.")
               return
           }

           DispatchQueue.main.async {
               self.capturedPhoto = CapturedPhoto(image: image)
           }
       }
}
