//
//  Coordinator.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import UIKit

class Coordinator {
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }

    func start(){
        let rootViewController = Affilation_inputTeacherRoleViewController()
        let navigationViewController = UINavigationController(rootViewController:
            rootViewController)
        navigationViewController.navigationBar.tintColor = .black
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
