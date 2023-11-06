//
//  VersionInfoViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/3/23.
//

import UIKit
import SnapKit

class VersionViewController: UIViewController {
    let versionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white

        // 버전 정보 레이블 설정
        versionLabel.text = "앱 버전: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
        versionLabel.textAlignment = .center
        versionLabel.textColor = .black
        view.addSubview(versionLabel)
        
        // 버전 레이블을 Auto Layout으로 설정
        versionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
