//
//  Login.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//
struct LoginRequest: Encodable {
    var email: String
    var pw: String
    var token: String
}

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let role: String
}

