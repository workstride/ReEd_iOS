//
//  UserProfileViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/20/23.
//

import Alamofire
import Foundation

class UserProfileViewModel {
    
    // 로그인 결과를 나타내는 클로저
    var userCompletion: ((Result<UserInfoResponse, Error>) -> Void)?
    
    // 토큰을 가져오는 부분을 옵셔널 타입으로 변경
    var token: String? {
        return KeychainManager.shared.getLoginInfo().token
    }
    
    // 서버 엔드포인트 URL
    let apiURL = ServiceConfiguration.baseUrl + "/member/profile"
    
    func getUserInfo() {
        guard let token = token, let url = URL(string: apiURL) else {

            self.userCompletion?(.failure(NSError(domain: "UserProfileViewModel", code: 0, userInfo: ["error": "Token or URL is missing"])))
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json"
        ]
        
        AF.request(url, method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserInfoResponse.self) { response in
                switch response.result {
                case .success(let userResponse):
                    // 성공 시 응답을 클로저를 통해 전달
                    self.userCompletion?(.success(userResponse))
                case .failure(let error):
                    // 실패 시 오류를 클로저를 통해 전달
                    self.userCompletion?(.failure(error))
                }
            }
    }
}
