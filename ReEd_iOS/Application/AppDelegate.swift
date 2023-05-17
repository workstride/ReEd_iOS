//
//  AppDelegate.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            window?.rootViewController = ViewController()

            return true
        }
}

