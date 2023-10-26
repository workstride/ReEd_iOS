//
//  UIViewController.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import UIKit

extension UIViewController {
    
    func setNavigationBackButton() {
        let backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtonItem
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
}
