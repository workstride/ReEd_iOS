//
//  Affilation_InputPasswordViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/28/23.
//

import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class Affilation_InputPasswordViewController: UIViewController {
    private let viewModel = Affilation_InputPasswordViewModel()
    private let disposeBag = DisposeBag()
    
    private let passwordStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fillEqually
    }
    
    private let passwordInfoLabel = UILabel().then {
        $0.text = "사용하실 비밀번호를\n입력해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private let inputPasswordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .default
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    
    private let checkPasswordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 한번 더 입력해주세요"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .default
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#D9D9D9"), for: .normal)
        $0.backgroundColor = (UIColor(hexCode: "#E8E8E8"))
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextStepButton.addTarget(self, action: #selector(nextStepBtnclicked), for: .touchUpInside)
        
        inputPasswordTextField.rx.text.orEmpty
            .bind(to: viewModel.inputPasswordTextField)
            .disposed(by: disposeBag)
        
        checkPasswordTextField.rx.text.orEmpty
            .bind(to: viewModel.checkPasswordTextField)
            .disposed(by: disposeBag)
        
        viewModel.isButtonEnabled
            .bind(to: nextStepButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isButtonEnabled
            .subscribe(onNext: { [unowned self] isEnabled in
                DispatchQueue.main.async {
                    self.nextStepButton.backgroundColor = isEnabled ? UIColor.blue : UIColor.gray
                }
            })
            .disposed(by: disposeBag)
        

        setupSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        passwordStackView.addArrangedSubview(inputPasswordTextField)
        passwordStackView.addArrangedSubview(checkPasswordTextField)
        
        [passwordInfoLabel,passwordStackView,nextStepButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        passwordInfoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
        }
        
        passwordStackView.snp.makeConstraints {
            $0.top.equalTo(passwordInfoLabel.snp.bottom).offset(80)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(120)
        }
        
        nextStepButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-80)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(48)
        }
    }
    
    @objc private func nextStepBtnclicked() {
        navigationController?.pushViewController(AttendanceViewController(), animated: true)
    }
}
