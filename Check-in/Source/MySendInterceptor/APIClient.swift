//
//  APIClient.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation
import Alamofire

public enum Result<T, Failure> where Failure: Error {
    case success(value: T)
    case error(error: Failure)
}


public class ApiClient {
    
    public static func refreshToken<T: Codable> (completion: @escaping (Result<T, ApiError>) -> Void) throws  {
        guard let refreshToken = StorageManager.shared.readTokens()?.refreshToken else {
            completion(Result.error(error: ApiError.unknownError))
            return
        }

        print(refreshToken)
        
        var urlConvertible: URLRequest
        = try! ApiRouter(requestConfigurator: RequestConfigurator(path: "/auth/refresh", parameters: ["refreshToken" : refreshToken],  httpMethod: .post)).asURLRequest()
        urlConvertible.setValue(refreshToken, forHTTPHeaderField: Constants.HttpHeaderField.refreshToken.rawValue)
        AF.request(urlConvertible).responseDecodable(of: T.self) {
            response in
            if response.error != nil {
                switch response.response?.statusCode {
                case 400:
                    completion(Result.error(error: ApiError.badRequest))
                case 403:
                    completion(Result.error(error: ApiError.forbidden))
                case 404:
                    completion(Result.error(error: ApiError.notFound))
                case 409:
                    completion(Result.error(error: ApiError.conflict))
                case 500:
                    completion(Result.error(error: ApiError.internalServerError))
                default:
                    completion(Result.error(error: ApiError.unknownError))
                }
            }
            if let value = response.value {
                completion(Result.success(value: value))
            }
        }
    }
    
    public static func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, ApiError>) -> Void)  {
        do {
            AF.request(try urlConvertible.asURLRequest(), interceptor: MySendInterceptor()).responseDecodable(of:T.self) {
                response in
                if response.error != nil {
                    switch response.response?.statusCode {
                    case 403:
                        completion(Result.error(error: ApiError.forbidden))
                    case 404:
                        completion(Result.error(error: ApiError.notFound))
                    case 409:
                        completion(Result.error(error: ApiError.conflict))
                    case 500:
                        completion(Result.error(error: ApiError.internalServerError))
                    default:
                        completion(Result.error(error: ApiError.unknownError))
                    }
                }
                
                if let value = response.value {
                    completion(Result.success(value: value))
                }
            }
            
        } catch {
            
        }
    }
}
