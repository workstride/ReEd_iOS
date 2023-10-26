//
//  LoginSelectMethodViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/16/23.
//

import UIKit
import SnapKit
import Then

class LoginSelectMethodViewController: UIViewController {

    private let loginStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 15
    }
    
    private let selectLoginStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let startWithEmailBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#D9D9D9"),for: .normal)
        $0.backgroundColor = (UIColor(hexCode: "#688BE3"))
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let orLabel = UILabel().then {
        $0.text = "또는"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textAlignment = .center
        $0.textColor = .systemGray
    }
    
    private let kakaoLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "Login_KakaoBtn"), for: .normal)
    }
    
    private let googleLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "Login_GoogleBtn"), for: .normal)
    }
    
    private let appleLoginBtn = UIButton().then {
        $0.setImage(UIImage(named: "Login_AppleBtn"), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
        
        
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        selectLoginStack.addArrangedSubview(loginStack)
        loginStack.addArrangedSubview(kakaoLoginBtn)
        loginStack.addArrangedSubview(googleLoginBtn)
        loginStack.addArrangedSubview(appleLoginBtn)
        [logoImage,startWithEmailBtn,orLabel,selectLoginStack,loginStack].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(130)
            $0.width.equalTo(220)
        }
        
        selectLoginStack.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.trailing.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(-20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-150)
        }
        
        loginStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-15)
        }
        
        orLabel.snp.makeConstraints {
            $0.bottom.equalTo(googleLoginBtn.snp.top).offset(-20)
            $0.width.equalTo(100)
            $0.centerX.equalTo(selectLoginStack)
        }
        
        startWithEmailBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-140)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
    }
    
    @objc func didTapKakaoLoginButton() {
        // 카카오톡 설치 여부 확인
    }
}
