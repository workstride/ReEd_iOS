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

    func saveLoginInfo(email: String, token: String) {
        // 키체인에 이메일과 토큰을 저장
        let emailSaved = KeychainWrapper.standard.set(email, forKey: emailKey)
        let tokenSaved = KeychainWrapper.standard.set(token, forKey: tokenKey)
        
        if emailSaved && tokenSaved {
            print("로그인 정보가 키체인에 저장되었습니다.")
        } else {
            print("로그인 정보를 키체인에 저장하는 데 문제가 발생했습니다.")
        }
    }

    func getLoginInfo() -> (email: String?, token: String?) {
        // 키체인에서 이메일과 토큰을 가져옴
        let email = KeychainWrapper.standard.string(forKey: emailKey)
        let token = KeychainWrapper.standard.string(forKey: tokenKey)
        return (email, token)
    }

    func deleteLoginInfo() {
        // 키체인에서 로그인 정보를 삭제
        let emailDeleted = KeychainWrapper.standard.removeObject(forKey: emailKey)
        let tokenDeleted = KeychainWrapper.standard.removeObject(forKey: tokenKey)
        
        if emailDeleted && tokenDeleted {
            print("로그인 정보가 키체인에서 삭제되었습니다.")
        } else {
            print("로그인 정보를 키체인에서 삭제하는 데 문제가 발생했습니다.")
        }
    }
}

