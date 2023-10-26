//
//  ReedLogo.swift
//  ReEd
//
//  Created by 김건우 on 10/16/23.
//

import UIKit

class ReedLogo {
    var ReedLogo: UIImage

    init() {
        // UIImage를 초기화하고 원하는 이미지 파일을 할당합니다.
        if let image = UIImage(named: "Logo") {
            ReedLogo = image
        } else {
            // 이미지를 찾을 수 없을 때의 처리
            ReedLogo = UIImage()
        }
    }

}
