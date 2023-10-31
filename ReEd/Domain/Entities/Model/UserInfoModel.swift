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

extension UserInfoResponse {
    // Date 형식을 파싱하는 데 사용할 DateFormatter를 정의
    private static var iso8601FractionalSecondsFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        formatter.timeZone = TimeZone(abbreviation: "UTC") // 원하는 시간대로 변경
        return formatter
    }()

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        email = try container.decode(String.self, forKey: .email)
        gender = try container.decode(Gender.self, forKey: .gender)
        birth = try container.decode(String.self, forKey: .birth)
        name = try container.decode(String.self, forKey: .name)
        tel = try container.decode(String.self, forKey: .tel)
        role = try container.decode(Role.self, forKey: .role)

        let regDateString = try container.decode(String.self, forKey: .regDate)
        regDate = Self.iso8601FractionalSecondsFormatter.date(from: regDateString) ?? Date()
    }
}
