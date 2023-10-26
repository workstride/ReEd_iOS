//
//  LoginViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var loginRequest = LoginRequest(email: "", pw: "", token: "")
    var loginViewModel = LoginViewModel()
    let checkBox = CheckBox()
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "이메일"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .default
        $0.isSecureTextEntry = true
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    
    private let viewPasswordButton = UIButton().then {
        $0.setTitle("보기", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#FFFFFF"), for: .normal)
        $0.backgroundColor = UIColor(hexCode: "#688BE3")
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
        setNavigationBackButton()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        forgotPasswordbutton.addTarget(self, action: #selector(didTapforgotPasdwordbutton), for: .touchUpInside)
        viewPasswordButton.addTarget(self, action: #selector(didTapViewPassword), for: .touchUpInside)
        checkBox.addTarget(self, action: #selector(didTapkeepLoginCheckBox), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        //MARK: - 키보드 제스쳐
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupSubviews() {
        
        [logoImage, emailTextField, passwordTextField, viewPasswordButton, loginButton, forgotPasswordbutton].forEach {
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
            $0.top.equalTo(logoImage.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        viewPasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField).offset(-10)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        forgotPasswordbutton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        checkBox.snp.makeConstraints {
            $0.width.equalTo(30) // 체크박스의 고정된 너비
        }
    }
    
    @objc private func didTapLoginButton() {
        loginRequest.email = emailTextField.text ?? ""
        loginRequest.pw = passwordTextField.text ?? ""
        
        loginViewModel.loginUser(loginRequest: loginRequest)
        
        loginViewModel.loginCompletion = { result in
            switch result {
            case .success(let loginResponse):
                // 로그인 성공 시 처리
                print("로그인 성공. accessToken: \(loginResponse.accessToken)")
                print("refreshToken: \(loginResponse.refreshToken)")
                print("role: \(loginResponse.role)")
                
                DispatchQueue.main.async {
                    let userAttendenceVC = UserAttendanceViewController()
                    self.dismiss(animated: true) {
                        UIApplication.shared.windows.first?.rootViewController =
                        userAttendenceVC
                    }
                }
                
            case .failure(let error):
                self.showAlert(message: "아이디 또는 비밀번호가 틀렸습니다.")
                print("로그인 실패. 오류: \(error)")
                
            }
        }
    }
    
    // MARK: - 로그인 버튼 및 로그인 서버 요청
    @objc private func didTapforgotPasdwordbutton() {
        dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = LoginSelectViewController()
        }
    }
    
    // MARK: - 비밀번호를 잊어버리셨나요? 버튼
    @objc private func didTapViewPassword() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            viewPasswordButton.setTitle("숨기기", for: .normal)
            
        } else {
            passwordTextField.isSecureTextEntry = true
            viewPasswordButton.setTitle("보기", for: .normal)
        }
    }
    // MARK: - 비밀번호 보기/숨기기
    
    @objc private func didTapkeepLoginCheckBox() {
        //        if let userID = emailTextField.text, let password = passwordTextField.text {
        checkBox.checkboxTappedHandler = {
            isChecked in
            if isChecked {
                print("CheckBox is checked.")
                
                // 여기에서 필요한 작업을 수행하세요.
            } else {
                print("CheckBox is unchecked.")
                // 여기에서 필요한 작업을 수행하세요.
            }
        }
    }
    // MARK: - 로그인 유지 체크박스
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let text = textField.text else { return true }
        
        let maxLength = 50
        
        let newLength = text.count + string.count - range.length
        return newLength <= maxLength
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

