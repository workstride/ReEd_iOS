//
//  AffilationInputEmailViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class Affilation_InputEmailViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = AffilationViewModel()
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    // MARK: - 스택뷰
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일 주소를\n입력해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    // MARK: - 이메일 라벨
    
    private let inputEmailTextField = UITextField().then {
        $0.placeholder = "Email"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .emailAddress
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    // MARK: - 이메일 텍스트 필드
    
    private let sendEmailButton = UIButton().then {
        $0.setTitle("인증 메일 받기", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#FFFFFF"), for: .normal)
        $0.backgroundColor = UIColor(hexCode: "#DBDBDB")
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    // MARK: - 이메일 버튼
    
    private let inputCertificationNumberTextField = UITextField().then {
        $0.isHidden = true // 초기에 숨김
        $0.placeholder = "인증번호를 입력해주세요"
        $0.setPlaceholderColor(.systemGray)
        $0.textColor = .black
        $0.keyboardType = .numberPad
        $0.autocapitalizationType = .none
        $0.borderStyle = .roundedRect
        $0.returnKeyType = .next
        $0.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    // MARK: - 인증번호 텍스트 필드
    
    private let messageForNoEmailLable = UILabel().then {
        $0.text = "인증 메일이 오지 않나요?"
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    // MARK: - 이메일이 오지 않나요? 라벨
    
    private let messageForNoEmailButton = UIButton().then {
        $0.setTitle("재전송하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    // MARK: - 이메일이 오지 않나요? 버튼
    
    private let nextViewButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#FFFFFF"), for: .normal)
        $0.backgroundColor = UIColor(hexCode: "#688BE3")
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    // MARK: - nextViewButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBackButton()
        setupSubviews()
        setupConstraints()
        sendEmailButton.isEnabled = false
        nextViewButton.isHidden = true
        inputEmailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        nextViewButton.addTarget(self, action: #selector(nextViewBtnclicked), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    
        // Email 입력 필드의 내용 변경을 ViewModel에 연결
        inputEmailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailText)
            .disposed(by: disposeBag)
        
        // Email 버튼 활성화 상태와 색상을 ViewModel에 연결
        viewModel.isEmailValid
            .bind(to: sendEmailButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.emailButtonColor
            .bind(to: sendEmailButton.rx.backgroundColor)
            .disposed(by: disposeBag)
        
        // Send Email 버튼 누를 때 Certification Number 텍스트 필드 표시 및 포커스
        sendEmailButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.inputEmailTextField.isUserInteractionEnabled = false
                // 이메일 입력 필드 비활성화
                self?.inputCertificationNumberTextField.isHidden = false
                self?.inputCertificationNumberTextField.becomeFirstResponder()
                self?.sendEmailButton.isHidden = true
                self?.nextViewButton.isHidden = false
            })
            .disposed(by: disposeBag)
        
        // Certification Number 입력이 완료되면 Email 입력 필드 다시 활성화
        inputCertificationNumberTextField.rx.controlEvent(.editingDidEndOnExit)
            .subscribe(onNext: { [weak self] in
                self?.inputEmailTextField.isUserInteractionEnabled = true
            })
            .disposed(by: disposeBag)
        }

    private func setupSubviews() {
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(inputEmailTextField)
        stackView.addArrangedSubview(inputCertificationNumberTextField)
        stackView.addArrangedSubview(sendEmailButton)
        stackView.addArrangedSubview(nextViewButton)
        
        let horizontalStackView = UIStackView(arrangedSubviews: [messageForNoEmailLable, messageForNoEmailButton])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        stackView.addArrangedSubview(horizontalStackView)
        
        let horizontalContainerView = UIView()
        horizontalContainerView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        stackView.addArrangedSubview(horizontalContainerView)
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        inputEmailTextField.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        
        inputCertificationNumberTextField.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        
        sendEmailButton.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        
        nextViewButton.snp.makeConstraints {
            $0.height.equalTo(55)
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            sendEmailButton.isEnabled = true
            sendEmailButton.backgroundColor = UIColor(hexCode: "#688BE3")
        } else {
            sendEmailButton.isEnabled = false
            sendEmailButton.backgroundColor = .gray
        }
    }
    // MARK: - 버튼 활성화
    
    @objc private func emailChecked(_ textField: UITextField) {
        if let emailRegex = textField.text, !emailRegex.isEmpty {
            
        }
    }
    
    @objc private func messageForNoEmailButtonDidTab() {
        
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func nextViewBtnclicked() {
        //navigationController?.pushViewController(StudentInfoVC(), animated: true)
    }
}
