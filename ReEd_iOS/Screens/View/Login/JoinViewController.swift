//
//  JoinViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/18.
//

import UIKit
import SnapKit
import Then

class JoinViewController: UIViewController {
    private let forgotPWTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
    }

    private let telTextField = UITextField().then {
        $0.placeholder = "전화번호를 입력해주세요"
        $0.keyboardType = .numberPad
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraint()
    }

    private func setUpSubviews() {
        [forgotPWTextField, telTextField].forEach {
            view.addSubview($0)
        }
    }

    private func setUpConstraint() {
        forgotPWTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(200)
        }

        telTextField.snp.makeConstraints {
            $0.top.equalTo(forgotPWTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
            }
        }

    }
