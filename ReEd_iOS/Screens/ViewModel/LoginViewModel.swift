//
//  LoginViewModel.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/07.
//
import RxSwift
import RxRelay

class LoginViewModel {
    let memberId = BehaviorRelay<String>(value: "")
    let memberPassword = BehaviorRelay<String>(value: "")
    
}
