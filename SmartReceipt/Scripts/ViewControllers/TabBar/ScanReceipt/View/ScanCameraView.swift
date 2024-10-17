//
//  ScanCameraView.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit
import AVFoundation

final class ScanCameraView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    private let captureSession = AVCaptureSession()
    private let output = AVCapturePhotoOutput()
    
    private var previewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    /// カメラの使用許可状態 選択していなければ許諾ダイアログ表示
    private var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            var isAuthorized = status == .authorized
            
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            return isAuthorized
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Task {
            await self.configureCamera()
        }
    }
    
    /// カメラの設定
    private func configureCamera() async {
        guard await isAuthorized else { return }
        
        captureSession.beginConfiguration()
        
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
        } catch {
            return
        }
        
        captureSession.addOutput(output)
        
        captureSession.commitConfiguration()
        
        previewLayer.session = captureSession
        
        startSession()
    }
    
    private func startSession() {
        Task.detached {
            self.captureSession.startRunning()
        }
    }
    
    private func stopSession() {
        captureSession.stopRunning()
    }
    
    /// 写真を撮る
    func shoot() {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .off
        output.capturePhoto(with: settings, delegate: self)
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension ScanCameraView: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            let image = UIImage(data: imageData)
            // 撮影した画像の文字検出
            VisionManager.read(image: image)
        }
    }
}
