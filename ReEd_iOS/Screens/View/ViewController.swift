//
//  ViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit
import SnapKit
import Then
// MARK: 5/2 - 코드 가독성 추가 
class ViewController: UIViewController {

    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
    }

    private let emailTextField = UITextField().then {
        $0.placeholder = "Email"
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
    }

    private let passwordTextField = UITextField().then {
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .done
    }

    private let loginButton = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }

    private let forgotPasswordbutton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    // MARK: 로그인 UI
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        loginButton.addTarget(self, action: #selector(didTapLoginButton),
        for: .touchUpInside)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
             view.addGestureRecognizer(tapGesture)
         }

         @objc private func dismissKeyboard() {
             view.endEditing(true)
         }
    // MARK: 키보드 제스처

    private func setupSubviews() {
        [logoImage, emailTextField, passwordTextField, loginButton, forgotPasswordbutton].forEach {
            view.addSubview($0)
        }
    }

    private func setupConstraints() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(200)
        }
        // MARK: 로고

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        // MARK: 이메일 필드

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        // MARK: 패스워드 필드

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        // MARK: 로그인 버튼 필드

        forgotPasswordbutton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        // MARK: 비밀번호 잃어버림 버튼

    }

    @objc private func didTapLoginButton() {

        let tabbarController = TabBarController()

        dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = tabbarController
        }

    }
}
