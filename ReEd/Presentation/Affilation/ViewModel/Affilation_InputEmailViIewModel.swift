//
//  Affilation_InputEmailViewModel.swift
//  ReEd
//
//  Created by 김건우 on 11/2/23.
//

import Alamofire
import Foundation

class Affilation_InputEmailViewModel {

// FIXME: 이메일 입력 뷰모델 수정
    
//
//    // 로그인 결과를 나타내는 클로저
//    var loginCompletion: ((Result<LoginResponse, Error>) -> Void)?
//    
//    
//    // 서버 엔드포인트 URL
//    let loginURL = ServiceConfiguration.baseUrl + "/auth"
//    
//    func SendEmail(SendJoinEmailResponse: sendJoinEmailResponse) {
//        
//        guard let url = URL(string: loginURL) else {
//            return
//        }
//        
//        AF.request(url, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default)
//            .validate(statusCode: 200..<300)
//            .responseDecodable(of: LoginResponse.self) { response in
//                switch response.result {
//                case .success(let loginResponse):
//                    // 로그인 성공 시 응답을 클로저를 통해 전달
//                    self.loginCompletion?(.success(loginResponse))
//                    
//                    // 로그인 정보를 키체인에 저장
//                    KeychainManager.shared.saveLoginInfo(email: loginRequest.email, token: loginResponse.accessToken, role: loginResponse.role)
//                case .failure(let error):
//                    // 실패 시 오류를 클로저를 통해 전달
//                    self.loginCompletion?(.failure(error))
//                }
//            }
//    }
}
