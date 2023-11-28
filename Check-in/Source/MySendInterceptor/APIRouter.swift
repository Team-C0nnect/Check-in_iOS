//
//  APIRouter.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation
import Alamofire


public struct ApiRouter: URLRequestConvertible {
    
    private var requestConfigurator: RequestConfigurator
    
    public init(requestConfigurator: RequestConfigurator) {
        self.requestConfigurator = requestConfigurator
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(requestConfigurator.path!))
        
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: requestConfigurator.parameters!)
    }
    
    
    private var method: HTTPMethod {
        return requestConfigurator.httpMethod!
    }
    
}
