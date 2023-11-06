//
//  QRCodeGenerateViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/31/23.
//

import Alamofire
import Foundation

class QRCodeGenerateViewModel {
    
    var token: String? {
        return KeychainManager.shared.getLoginInfo().token
    }
    
    func QRCodeGenerate(completion: @escaping (Result<GenerateQRCodeResponse, Error>) -> Void) {
        guard let token = token else {
                    // Handle the case where the token is nil (not available)
                    // You can return an error or take appropriate action
                    return
                }
                
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token))",
            "Accept": "application/json"
        ]
        
        let requestBody = [
            "courseId": 5,
            "academyId": 3,
            "memberId": 7
        ]
        
        let serverURL = "http://52.79.171.108:8080/api/attendance/generate/qrcode"
        
        AF.request(serverURL, method: .post, parameters: requestBody, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: GenerateQRCodeResponse.self) { response in
                switch response.result {
                case .success(let generatedQRCodeResponse):
                    completion(.success(generatedQRCodeResponse))
                case .failure(let error):
                    completion(.failure(error))
                    
                }
            }
    }
}
