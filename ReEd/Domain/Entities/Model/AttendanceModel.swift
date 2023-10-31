//
//  AttendanceModel.swift
//  ReEd
//
//  Created by 김건우 on 10/28/23.
//

import Foundation

struct QRCodeRequest: Encodable {
    var code: String
}

struct GenerateQRCodeRequest: Encodable {
    var courseId: Int64
    var academyId: Int64
    var memberId: Int64
}

struct GenerateQRCodeResponse: Decodable {
    let code: String
    let date: Date
}
 
struct NFCRequest: Encodable {
    let code: String
}
