//
//  UserInfo.swift
//  ReEd
//
//  Created by 김건우 on 10/20/23.
//

import Foundation

struct UserInfoResponse: Codable {
    let id: Int
    let email: String
    let gender: gender
    let birth: String
    let name: String
    let tel: String
    let role: role
    let regDate: Date
}

enum gender: String, Codable {
    case female = "FEMALE"
    case male = "MALE"
}

enum role: String, Codable{
    case student = "STUDENT"
    case parent =  "PARENT"
    case teacher = "TEACHER"
    case Head_teacher = "HEAD_TEACHER"
    case manager = "MANAGER"
    case admin = "ADMIN"
}
