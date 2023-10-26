//
//  CheckBox.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import UIKit

class CheckBox: UIButton {
    var isChecked = false {
        didSet {
            if isChecked {
                setImage(UIImage(named: "MaterialDesign1"), for: .normal)
            }
            else {
                setImage(UIImage(named: "MaterialDesign"), for: .normal)
            }
            checkboxTappedHandler?(isChecked)
        }
    }
    
    var checkboxTappedHandler: ((Bool) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "MaterialDesign"), for: .normal)
        addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @objc private func checkboxTapped() {
        isChecked.toggle()
    }
}


