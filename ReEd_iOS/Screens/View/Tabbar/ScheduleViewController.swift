//
//  ScheduleViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit
import SnapKit
import Then

class ScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let helloLabel = UILabel()
        helloLabel.text = "World!"
        helloLabel.textColor = .black
        helloLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        helloLabel.textAlignment = .center
        view.addSubview(helloLabel)

        helloLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
// MARK: 선생 - 학생 일정관리 
