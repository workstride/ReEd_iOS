//
//  QRCodeScanViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/28/23.
//

import Alamofire

class QRCodeScanViewModel {
    func sendQRCodeToServer(code: String, completion: @escaping (Result<Void, Error>) -> Void) {
        var headers: HTTPHeaders = [:]

        if let unwrappedToken = KeychainManager.shared.getLoginInfo().token {
            headers = [
                "Authorization": "Bearer " + unwrappedToken
            ]
        } else {
            print("토큰이 nil입니다.")
        }

        let request = QRCodeRequest(code: code)
        let serverURL = "http://52.79.171.108:8080/api/attendance/qrcode"

        AF.request(serverURL, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
