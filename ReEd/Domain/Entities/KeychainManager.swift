//
//  UserKeyChain.swift
//  ReEd
//
//  Created by 김건우 on 10/19/23.
//

import SwiftKeychainWrapper

class KeychainManager {
    
    static let shared = KeychainManager()

    private let emailKey = "userEmail"
    private let tokenKey = "userToken"
    private let roleKey = "userRole"

    func saveLoginInfo(email: String, token: String, role: String) {
        // 키체인에 이메일과 토큰을 저장
        let emailSaved = KeychainWrapper.standard.set(email, forKey: emailKey)
        let tokenSaved = KeychainWrapper.standard.set(token, forKey: tokenKey)
        let roleSaved = KeychainWrapper.standard.set(role, forKey: roleKey)
        
        if emailSaved && tokenSaved && roleSaved {
            print("로그인 정보가 키체인에 저장되었습니다.")
        } else {
            print("로그인 정보를 키체인에 저장하는 데 문제가 발생했습니다.")
        }
    }

    func getLoginInfo() -> (email: String?, token: String?, role: String?) {
        // 키체인에서 이메일과 토큰을 가져옴
        let email = KeychainWrapper.standard.string(forKey: emailKey)
        let token = KeychainWrapper.standard.string(forKey: tokenKey)
        let role = KeychainWrapper.standard.string(forKey: roleKey)
        return (email, token, role)
    }
}

