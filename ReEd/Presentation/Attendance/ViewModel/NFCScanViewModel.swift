//
//  NFCScanViewModel.swift
//  ReEd
//
//  Created by 김건우 on 10/31/23.
//

import Alamofire

class NFCScanViewModel {
    
    func sendNFCToServer(code: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let token = KeychainManager.shared.getLoginInfo().token
        
        let headers: HTTPHeaders = [
            "accept": "*/*",
            "Authorization": "Bearer + \(String(describing: token))",
        ]

        let request = NFCRequest(code: (String(describing: code)))
        

        let serverURL = "http://52.79.171.108:8080/api/attendance/nfc"
        
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
