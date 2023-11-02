//
//  JoinModel.swift
//  ReEd
//
//  Created by 김건우 on 11/2/23.
//

import Foundation

struct sendJoinEmailResponse : Encodable {
    var email : String
}

struct sendJoinCodeRequest: Decodable {
    let key : String
}



