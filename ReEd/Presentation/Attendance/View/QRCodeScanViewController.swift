//
//  QRCodeScanViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import AVFoundation
import SnapKit
import Then

class QRCodeScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var HomeViewController: UIViewController?
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var centerImageView: UIImageView!
            
    let qrCodeViewModel = QRCodeScanViewModel()
    let topAreaHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interfaceView = UIView()
           interfaceView.backgroundColor = .clear  // Set background color as needed
           view.addSubview(interfaceView)
        
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            fatalError("No video capture device is available")
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.backgroundColor = .white
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = CGRect(x: 0, y: topAreaHeight, width: view.bounds.width, height: view.bounds.height - topAreaHeight)
        centerImageView = UIImageView(image: UIImage(named: "QRImg"))
        centerImageView.contentMode = .scaleAspectFit
        view.addSubview(centerImageView)
        
        centerImageView.snp.makeConstraints {
            $0.center.equalTo(view)
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if !self.captureSession.isRunning {
                self.captureSession.startRunning()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            if let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
               let stringValue = readableObject.stringValue {
                print("인식한 QR 코드: \(stringValue)")
                handleQRCodeDetected(value: stringValue)
            }
        }
    }
    
    func handleQRCodeDetected(value: String) {
        // 카메라 종료
        if captureSession.isRunning {
            captureSession.stopRunning()
        }

        // 서버에 QR 코드 값 전송
        qrCodeViewModel.sendQRCodeToServer(code: value) { [weak self] result in
            switch result {
            case .success:
                
                let alertController = UIAlertController(title: "출석완료!", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default) { _ in

                    self?.dismiss(animated: true) {
                        UIApplication.shared.windows.first?.rootViewController = AttendanceViewController()
                    }
                }
                
                alertController.addAction(okAction)
                self?.present(alertController, animated: true, completion: nil)
            case .failure(let error):
                // 서버 요청 실패 처리
                print("서버 요청 실패: \(error)")
                
                let alertController = UIAlertController(title: "인증 실패", message: nil, preferredStyle: .alert)
                
                let closeAction = UIAlertAction(title: "닫기", style: .default) { _ in
                    self?.dismiss(animated: true) {
                        UIApplication.shared.windows.first?.rootViewController = AttendanceViewController()
                    }
                }
                
                alertController.addAction(closeAction)
                self?.present(alertController, animated: true, completion: nil)
            }
        }
    }

    
}
