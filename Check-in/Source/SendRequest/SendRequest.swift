//
//  SendRequest.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/21/23.
//

import Foundation
import Alamofire

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}


class SendRequest {
    func request<T: Codable> (domain: String, method: HTTPMethod, model: T.Type) {
        let url: String = "http://43.202.136.92:8080"
        
        let tokenData = GoogleLoginAction.shared.tokenData
        
        let headers: HTTPHeaders = HTTPHeaders(arrayLiteral: .authorization(bearerToken: tokenData.accessToken))
        
        AF.request("\(url)\(domain)",
                   method: method,
                   headers: headers)
        .responseDecodable(of: T.self) { response in
            if response.error != nil { 
                switch response.result {
                case .success(_): break
                    
                case .failure(_): break
                    
                }
            }
        }
    }
}
