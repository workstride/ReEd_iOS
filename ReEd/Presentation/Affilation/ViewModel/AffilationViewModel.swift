//
//  AffilationViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/27/23.
//

import UIKit
import RxSwift
import RxCocoa

class AffilationViewModel {
    
    let emailText = BehaviorRelay<String>(value: "")
    let isEmailValid: Observable<Bool>
    let emailButtonColor: Observable<UIColor>
    
    init() {
        isEmailValid = emailText
            .map { !$0.isEmpty }
        emailButtonColor = isEmailValid
            .map { $0 ? UIColor(hexCode: "#688BE3") : .gray }
    }
}



