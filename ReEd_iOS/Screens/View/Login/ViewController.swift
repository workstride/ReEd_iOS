//
//  ViewController.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController, UITextFieldDelegate {

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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        forgotPasswordbutton.addTarget(self, action: #selector(didTapforgotPasdwordbutton), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

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

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        forgotPasswordbutton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }

    @objc private func didTapLoginButton() {
        let tabbarController = TabBarController()
        dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = tabbarController
        }
    }

    @objc private func didTapforgotPasdwordbutton() {
        let joinViewController = JoinViewController()
        dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = joinViewController
        }
    }

    // MARK: UITextFieldDelegate

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let text = textField.text else { return true }

        let maxLength = 8

        let newLength = text.count + string.count - range.length
        return newLength <= maxLength
    }

}
