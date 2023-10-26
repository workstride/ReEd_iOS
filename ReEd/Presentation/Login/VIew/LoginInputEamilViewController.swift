//
//  LoginInputEamilViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/17/23.
//

import SnapKit
import Then
import UIKit

class LoginInputEamilViewController: UIViewController {

    private let inputEmailTextField = UITextField().then {
    
        $0.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: $0.frame.size.height-1, width: $0.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        $0.layer.addSublayer((border))
        $0.textAlignment = .center
        $0.textColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(inputEmailTextField)
    }
    
    private func setupConstraints() {
        inputEmailTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
