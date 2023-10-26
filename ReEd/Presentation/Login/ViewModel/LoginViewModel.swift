//
//  LoginViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/11/23.
//

import Alamofire

class LoginViewModel {
    
    // 로그인 결과를 나타내는 클로저
    var loginCompletion: ((Result<LoginResponse, Error>) -> Void)?
    
    // 서버 엔드포인트 URL
    let loginURL = "http://52.79.171.108:8080/api/auth"
    
    func loginUser(loginRequest: LoginRequest) {
        AF.request(loginURL, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    // 로그인 성공 시 응답을 클로저를 통해 전달
                    self.loginCompletion?(.success(loginResponse))
                    
                    // 로그인 정보를 키체인에 저장
                    KeychainManager.shared.saveLoginInfo(email: loginRequest.email, token: loginResponse.accessToken)
                case .failure(let error):
                    // 실패 시 오류를 클로저를 통해 전달
                    self.loginCompletion?(.failure(error))
                }
            }
    }
    
    func logoutUser() {
        // 로그아웃 시 로그인 정보를 키체인에서 삭제
        KeychainManager.shared.deleteLoginInfo()
    }
}
