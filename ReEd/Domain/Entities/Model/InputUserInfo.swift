//
//  InputUserInfo.swift
//  ReEd
//
//  Created by 김건우 on 11/2/23.
//

import Foundation

class InputUserInfo {
    static let shared = InputUserInfo()
    
    var id: String?
    var password: String?
    var name: String?
    
    private init() { }
}
