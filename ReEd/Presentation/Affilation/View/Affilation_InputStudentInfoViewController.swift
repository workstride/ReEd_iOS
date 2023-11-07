//
//  Affilation_InputStudentInfoViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import SnapKit
import Then

class Affilation_InputStudentInfoViewController: UIViewController {
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let studentInfoLabel = UILabel().then {
        $0.text = "학생정보를\n등록해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private let inputNameTextField = InfoTextField("이름")
    private let inputBirthTextField = InfoTextField("생년월일")
    private let inputSchoolTextField = InfoTextField("소속학교")
    private let inputGradeTextField = InfoTextField("학년")
    private let inputTelTextField = InfoTextField("전화번호")
    
    private let genderPicker = UISegmentedControl().then {
        $0.insertSegment(withTitle: "남성", at: 0, animated: false)
        $0.insertSegment(withTitle: "여성", at: 1, animated: false)
        $0.insertSegment(withTitle: "기타", at: 2, animated: false)
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = UIColor(hexCode: "#eeeeef")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let nextStepBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#D9D9D9"), for: .normal)
        $0.backgroundColor = (UIColor(hexCode: "#688BE3"))
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        nextStepBtn.addTarget(self, action: #selector(didTapnextStepBtn), for: .touchUpInside)
    }
    
    private func setupSubviews() {
        view.addSubview(studentInfoLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(inputNameTextField)
        stackView.addArrangedSubview(inputBirthTextField)
        stackView.addArrangedSubview(inputSchoolTextField)
        stackView.addArrangedSubview(inputGradeTextField)
        stackView.addArrangedSubview(inputTelTextField)
        stackView.addArrangedSubview(genderPicker)
        stackView.addArrangedSubview(nextStepBtn)
    }
    
    private func setupConstraints() {
        studentInfoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(studentInfoLabel.snp.bottom).offset(70)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(view.snp.width)
        }
        
        nextStepBtn.snp.makeConstraints {
            $0.top.equalTo(genderPicker.snp.bottom).offset(30)
        }
        
        let inputFields = [inputNameTextField, inputBirthTextField, inputSchoolTextField, inputTelTextField,inputGradeTextField,nextStepBtn]
        inputFields.forEach { textField in
            textField.snp.makeConstraints {
                $0.height.equalTo(50)
            }
            
        }
    }
    
    @objc private func didTapnextStepBtn() {
        //navigationController?.pushViewController(SuccessJoinViewController(), animated: true)
    }
    
}
