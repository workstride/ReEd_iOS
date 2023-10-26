//
//  UserProfileViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/20/23.
//
/*
import Foundation
import SwiftKeychainWrapper
import Alamofire

class UserProfileViewModel {
    // 토큰 키를 KeychainManager 클래스에서 가져오거나 직접 설정합니다.
    private let tokenKey = "userToken"
    
    // API 엔드포인트 URL
    private let apiURL = "https://your-api-url.com" // 여기에 실제 API URL을 입력하세요

    // API 요청을 보내는 메서드
    func fetchUserInfo(completion: @escaping (Result<UserInfoResponse, Error>) -> Void) {
        // Keychain에서 토큰을 가져옵니다.
        if let token = KeychainManager.shared.getLoginInfo().token {
            // 만약 토큰이 있다면, API 요청을 보냅니다.
            let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
            
            // Alamofire를 사용하여 API 요청을 보냅니다.
            AF.request(apiURL, method: .get, headers: headers).responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let userInfo = try JSONDecoder().decode(UserInfoResponse.self, from: data as! Data)
                        completion(.success(userInfo))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    // API 요청이 실패했을 때의 처리
                    completion(.failure(error))
                }
            }
        } else {
            // 토큰이 없을 경우, 로그인이 필요한 처리
            completion(.failure(NSError(domain: "TokenErrorDomain", code: -1, userInfo: nil)))
        }
    }
}
*/
