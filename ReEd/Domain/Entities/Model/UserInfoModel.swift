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
    let gender: Gender
    let birth: String
    let name: String
    let tel: String
    let role: Role
    let regDate: Date

    enum Gender: String, Codable {
        case female = "FEMALE"
        case male = "MALE"
    }

    enum Role: String, Codable {
        case student = "STUDENT"
        case parent = "PARENT"
        case teacher = "TEACHER"
        case headTeacher = "HEAD_TEACHER"
        case manager = "MANAGER"
        case admin = "ADMIN"
    }
}
