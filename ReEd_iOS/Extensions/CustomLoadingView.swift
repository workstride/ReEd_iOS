//
//  CustomLoadingView.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/29.
//

import UIKit
import Lottie

class CustomLoadingView: UIView {
    private let animationView: LottieAnimationView

    override init(frame: CGRect) {
        animationView = LottieAnimationView(name: "Customloading")

        super.init(frame: frame)

        configureAnimationView()
    }

    required init?(coder aDecoder: NSCoder) {
        animationView = LottieAnimationView(name: "Customloading")

        super.init(coder: aDecoder)

        configureAnimationView()
    }

    private func configureAnimationView() {
        animationView.frame = bounds
        addSubview(animationView)
        animationView.loopMode = .loop
        animationView.play()
    }
}

