//
//  CustomPlaceholder.swift
//  ReEd
//
//  Created by 김건우 on 11/7/23.
//

import UIKit

extension UITextView {
    func addPlaceholder(text: String) {
        let placeholderLabel = UILabel()
        placeholderLabel.text = text
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = self.font
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin = CGPoint(x: 5, y: 5)
        placeholderLabel.tag = 100
        
        if !self.text.isEmpty {
            self.viewWithTag(100)?.removeFromSuperview()
        } else {
            self.addSubview(placeholderLabel)
        }
    }
}
