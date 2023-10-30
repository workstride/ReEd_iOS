//
//  AffilationSelectRoleViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import Then
import SnapKit

let segementItems = ["학생","교사","학부모"]
let segementImgItems = ["student","teacher","parent"]

class Affilation_SelectRoleViewController : UIViewController {
    
    private let affiliationLabel = UILabel().then {
        $0.text = "소속이 어떻게\n되시나요?"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textAlignment = .left
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private let affiliationPicker = UISegmentedControl(items: segementItems).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = (UIColor(hexCode: "#eeeeef"))
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let affiliationImage = UIImageView().then {
        $0.image = UIImage(named: "student")
        $0.contentMode = .scaleAspectFit
    }

    
    private let affiliationButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = (UIColor(hexCode: "#688BE3"))
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBackButton()
        setupSubviews()
        setupConstraints()
        affiliationPicker.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        affiliationButton.addTarget(self, action: #selector(affiliationBtnClicked), for: .touchUpInside)
    }
    
    private func setupSubviews() {
        [affiliationLabel,affiliationImage,affiliationPicker,affiliationButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        
        affiliationLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        affiliationImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(280)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(1.0)
            $0.height.equalTo(0.8 * 150)
        }

        affiliationPicker.snp.makeConstraints {
            $0.top.equalTo(affiliationImage.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(34)
        }
        
        affiliationButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            $0.height.equalTo(55)
        }
    }
    
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        let seletedIndex = sender.selectedSegmentIndex
        affiliationImage.image = UIImage(named: segementImgItems[seletedIndex])
    }
    
    @objc private func affiliationBtnClicked() {
        //navigationController?.pushViewController(InputEmailVC(), animated: true)
    }
}
