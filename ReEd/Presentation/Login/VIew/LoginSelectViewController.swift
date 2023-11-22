//
//  SelectLoginViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import UIKit
import SnapKit
import Then

class LoginSelectViewController: UIViewController {
    
    private let loginStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
        $0.distribution = .fillEqually
    }
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "Logo")
        $0.contentMode = .scaleAspectFit
    }
    // MARK: - logoImage
    
    private let loginBtn = CustomButton("로그인")
    
    //MARK: - loginBtn
    
    private let joinBtn = CustomButton("회원가입")
    
    //MARK: - joinBtn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        
        loginBtn.addTarget(self,
        action: #selector(didTapLoginButton),
        for: .touchUpInside)
        
        joinBtn.addTarget(self,
        action: #selector(didTapJoinButton),
        for: .touchUpInside)
    }
}

extension LoginSelectViewController {
    
    private func setupSubviews() {
        loginStackView.addArrangedSubview(loginBtn)
        loginStackView.addArrangedSubview(joinBtn)
        [loginStackView,logoImage].forEach {
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
        
        loginStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-160)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
    
    @objc private func didTapJoinButton() {
        showAlert(message: "준비중입니다.")
        //FIXME: 회원가입 뷰 준비
    }
    
    @objc private func didTapLoginButton() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
