//
//  MySendInterceptor.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation
import Alamofire

final class MySendInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(Constants.baseUrl) == true, let accessToken = StorageManager.shared.readTokens()?.accessToken else {
            completion(.success(urlRequest))
            return
        }
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        //        response.response?.statusCode
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        if  request.retryCount > 2 {
            completion(.doNotRetry)
            return
        }
        try! ApiClient.refreshToken { (result : Result<GoogleLoginModel?, ApiError>) in
            switch result {
            case .success(let auth):
                if let token = auth {
                    StorageManager.shared.updateTokens(token)
                    completion(.retry)
                }
                completion(.doNotRetry)
            case .error(let error):
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
