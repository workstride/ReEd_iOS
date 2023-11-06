//
//  QRCodeGenerateViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/29/23.
//

import UIKit
import SnapKit
import Alamofire
import QRCode
import Foundation

class QRCodeGenerateViewController: UIViewController {
    private let qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let qrCodeGenerateViewModel = QRCodeGenerateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(qrCodeImageView)
        
        qrCodeImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        qrCodeGenerateViewModel.QRCodeGenerate { result in
            do {
                switch result {
                case .success(let generateQRCodeResponse):
                    // QRCode 생성
                    if let qrCode = try QRCode(string: generateQRCodeResponse.code) {
                        self.qrCodeImageView.image = try qrCode.image()
                    }
                case .failure(let error):
                    print("QRCode generation failed with error: \(error)")
                }
            } catch {
                print("An error occurred while generating QRCode: \(error)")
            }
        }
    }
}
