//
//  AttendanceViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit
import SnapKit
import Then

class AttendanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let helloLabel = UILabel()
        helloLabel.text = "Hello!"
        helloLabel.textColor = .black
        helloLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        helloLabel.textAlignment = .center
        view.addSubview(helloLabel)

        helloLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
// MARK: 학생 - 출석 뷰 컨트롤러
