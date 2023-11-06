//
//  Bundle.swift
//  ReEd
//
//  Created by 김건우 on 11/3/23.
//

import Foundation

extension Bundle {
    static func setLanguage(_ language: String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
