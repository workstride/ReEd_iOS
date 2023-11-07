//
//  EventViewController.swift
//  ReEd
//
//  Created by 김건우 on 11/7/23.
//

import UIKit
import Then
import SnapKit

class EventViewController: UIViewController {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let saveButton = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }
    
    private let titleTextView = UITextField().then {
        $0.placeholder = "제목을 입력해주세요"
        $0.borderStyle = .bezel
    }
    
    private let titleText = UILabel().then {
        $0.text = "제목"
        $0.textColor = .black
        $0.sizeToFit()
        $0.textAlignment = .left
    }
    
    private let contentTextView = UITextField().then {
        $0.placeholder = "내용을 입력해주세요"
        $0.borderStyle = .bezel
    }
    
    private let contentText = UILabel().then {
        $0.text = "자세한 내용"
        $0.textColor = .black
        $0.sizeToFit()
        $0.textAlignment = .left
    }
    
    init(date: String, title: String, content: String) {
        super.init(nibName: nil, bundle: nil)
        
        dateLabel.text = "날짜: \(date)"
        titleTextView.text = title
        contentTextView.text = content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(dateLabel)
        view.addSubview(titleTextView)
        view.addSubview(contentTextView)
        view.addSubview(titleText)
        view.addSubview(contentText)
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        titleText.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(dateLabel.snp.bottom).offset(50)
        }
        
        titleTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleText.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(titleText.snp.bottom).offset(42)
        }
        
        contentText.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(titleText.snp.bottom).offset(70)
        }
        
        contentTextView.snp.makeConstraints { (make) in
            make.top.equalTo(contentText.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(contentText.snp.bottom).offset(150)
        }
    }
}
