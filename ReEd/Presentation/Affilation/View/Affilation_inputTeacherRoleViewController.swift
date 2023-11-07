//
//  Affilation_TeacherSelectRoleViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/7/23.
//

import Alamofire
import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class Affilation_inputTeacherRoleViewController: UIViewController {
    
        private let inputAcademyTextField = InfoTextField("학원명")
        private let inputAcademyAddressTextField = InfoTextField("학원주소")
        private let inputAcademyDetailedAddressTextField = InfoTextField("상세주소")
        
        private let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 20
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            $0.isLayoutMarginsRelativeArrangement = true
        }
    
        private let studentInfoLabel = UILabel().then {
            $0.text = "직책과 소속을\n등록해주세요"
            $0.font = UIFont.boldSystemFont(ofSize: 24)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.numberOfLines = 2
        }
        
        
        private let rolePicker = UISegmentedControl().then {
            $0.insertSegment(withTitle: "원장 선생님", at: 0, animated: false)
            $0.insertSegment(withTitle: "선생님", at: 1, animated: false)
            $0.selectedSegmentIndex = 0
            $0.backgroundColor = UIColor(hexCode: "#eeeeef")
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        private let nextStepBtn = UIButton().then {
            $0.setTitle("다음", for: .normal)
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
            [stackView,studentInfoLabel,rolePicker].forEach {
                view.addSubview($0)
            }
            
            stackView.addArrangedSubview(inputAcademyTextField)
            stackView.addArrangedSubview(inputAcademyAddressTextField)
            stackView.addArrangedSubview(inputAcademyDetailedAddressTextField)
            stackView.addArrangedSubview(nextStepBtn)
        }
        
        private func setupConstraints() {
            studentInfoLabel.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                $0.leading.equalTo(view.snp.leading).offset(20)
                $0.trailing.equalTo(view.snp.trailing).offset(-20)
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            }
            
            rolePicker.snp.makeConstraints {
                $0.top.equalTo(studentInfoLabel.snp.bottom).offset(350)
                $0.leading.equalTo(view.snp.leading).offset(20)
                $0.trailing.equalTo(view.snp.trailing).offset(-20)
                $0.bottom.equalTo(studentInfoLabel.snp.bottom).offset(380)
            }
            
            stackView.snp.makeConstraints {
                $0.top.equalTo(rolePicker.snp.top).offset(10)
                $0.leading.equalTo(view.snp.leading).offset(20)
                $0.trailing.equalTo(view.snp.trailing).offset(-20)
                $0.bottom.equalTo(nextStepBtn.snp.top).offset(-30)
            }
            
            nextStepBtn.snp.makeConstraints {
                $0.top.equalTo(inputAcademyDetailedAddressTextField.snp.bottom).offset(20)
            }
            
            nextStepBtn.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
                $0.leading.equalTo(view.snp.leading).offset(20)
                $0.trailing.equalTo(view.snp.trailing).offset(-20)
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
                
            }
        }
        
        @objc private func didTapnextStepBtn() {
            //navigationController?.pushViewController(SuccessJoinViewController(), animated: true)
        }
    
//        @objc func segmentValueChanged(_ sender: UISegmentedControl) {
//            let seletedIndex = sender.selectedSegmentIndex
//            affiliationImage.image = UIImage(named: segementImgItems[seletedIndex])
//        }
        
    }
