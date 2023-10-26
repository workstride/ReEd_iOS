//
//  CustomButton.swift
//  ReEd
//
//  Created by 김건우 on 10/18/23.
//

import UIKit

class CustomButton: UIButton {
    
    init(_ title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(hexCode: "#D9D9D9"), for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = (UIColor(hexCode: "#688BE3"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
