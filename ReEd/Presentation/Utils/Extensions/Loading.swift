//
//  Loading.swift
//  ReEd
//
//  Created by 김건우 on 10/30/23.
//

import UIKit

extension UIViewController {
    
    func showLoadingIndicator() {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.center = view.center
        indicatorView.startAnimating()
        indicatorView.tag = 123 // 고유한 태그를 지정

        view.addSubview(indicatorView)
    }

    func hideLoadingIndicator() {
        if let indicatorView = view.viewWithTag(123) as? UIActivityIndicatorView {
            indicatorView.stopAnimating()
            indicatorView.removeFromSuperview()
        }
    }
}
