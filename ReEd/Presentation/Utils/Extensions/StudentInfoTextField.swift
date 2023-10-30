//
//  StudentInfoTextField.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit

class StudentInfoTextField: UITextField {
    init(_ title: String) {
        super.init(frame: .zero)
        
        self.placeholder = title
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray, // .systemGray 색상
        ]
        self.attributedPlaceholder = NSAttributedString(string: title, attributes: placeholderAttributes)
        
        self.textColor = .black
        self.keyboardType = .phonePad
        self.borderStyle = .roundedRect
        self.returnKeyType = .next
        self.backgroundColor = UIColor(hexCode: "#E8E8E8")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

