////
////  LoginViewModel.swift
////  ReEd_iOS
////
////  Created by 김건우 on 2023/05/07.
////
// import Foundation
// import RxSwift
// import RxRelay
//
// class LoginViewModel {
//    let idObservable = BehaviorRelay<String>(value: "")
//    let passwordObservable = BehaviorRelay<String>(value: "")
//    private let disposeBag = DisposeBag()
//
//    var isValid: Observable<Bool> {
//        return Observable.combineLatest(idObservable, passwordObservable)
//            .map { email, password in
//                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
//            }
//    }
//
//    func login() {
//        guard let username = idObservable.value,
//              let password = passwordObservable.value else {
//            return
//        }
//
//        // 서버 요청 및 응답 처리 로직
//        authenticateUser(username: username, password: password)
//            .subscribe(onNext: { [weak self] user in
//                // 로그인 성공 시 유저 타입과 토큰을 저장하거나 다른 작업 수행
//                // 예: self?.saveUser(user)
//            }, onError: { error in
//                // 로그인 실패 처리
//            })
//            .disposed(by: disposeBag)
//    }
//
//    private func authenticateUser(username: String, password: String) -> Observable<User> {
//        // 서버 요청 및 응답을 처리하는 로직을 구현하고 Observable<User>을 반환합니다.
//        // 예: API 호출 등
//    }
// }
//
