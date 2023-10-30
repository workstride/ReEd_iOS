//
//  Affilation_InputPasswordViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/28/23.
//

import UIKit
import RxSwift
import RxCocoa

class Affilation_InputPasswordViewModel {
    
    let inputPasswordTextField = BehaviorRelay<String>(value: "")
    let checkPasswordTextField = BehaviorRelay<String>(value: "")
    
    var isButtonEnabled: Observable<Bool> {
        return Observable.combineLatest(inputPasswordTextField.asObservable(), checkPasswordTextField.asObservable())
            .map { inputPasswordTextField, checkPasswordTextField in
                return !inputPasswordTextField.isEmpty && !checkPasswordTextField.isEmpty && inputPasswordTextField == checkPasswordTextField
            }
    }

}
