//
//  LoginViewModel.swift
//  ReEd_iOS
//
//  Created by 김건우 on 2023/05/07.
//
import RxSwift
import RxRelay

class LoginViewModel {
    let idObservable = BehaviorRelay<String>(value: "")
    let passwordObservable = BehaviorRelay<String>(value: "")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(idObservable,passwordObservable)
            .map { email, password in
                print("Email : \(email), Password : \(password)")
                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
            }
    }

}
