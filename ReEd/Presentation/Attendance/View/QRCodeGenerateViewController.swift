//
//  QRCodeGenerateViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/29/23.
//

//import UIKit
//import SnapKit
//import Then
//import EFQRCode
//
//class QRCodeGenerateViewController {
//    func generateQRCode() -> UIImage? {
//        let text = "123"
//        
//        guard let weakSelf = self else { return nil }
//
//        let generateClosure: () -> UIImage? = { [weak weakSelf] in
//            guard let self = weakSelf else { return nil }
//
//            if let image = EFQRCode.generate(
//                content: text,
//                backgroundColor: UIColor.white.cgColor,
//                foregroundColor: UIColor.black.cgColor
//            ) {
//                return UIImage(cgImage: image)
//            }
//
//            return nil
//        }
//
//        return generateClosure()
//    }
//}
//
//// QR 코드 생성기 인스턴스 생성
//let generator = QRCodeGenerateViewController()
//
//// QR 코드 생성
//if let qrCodeImage = generator.generateQRCode() {
//    // 생성된 QR 코드 이미지를 사용하거나 표시합니다.
//    let imageView = UIImageView(image: qrCodeImage)
//    // 뷰에 추가하거나 화면에 표시할 수 있습니다.
//}
//
//
