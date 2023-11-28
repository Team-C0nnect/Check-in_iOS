//
//  RequestConfigurator.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation
import Alamofire

public struct RequestConfigurator {
    
    // MARK: - Variables
    
    // Parameters that will be passed into url
    public var parameters: Parameters?
    
    // Additional path will be added to source url
    public var path: String?
    
    // The HTTP Method of the request
    public var httpMethod: HTTPMethod?
    
    // MARK: - Initializer
    public init(path: String = "", parameters: Parameters? = [:], httpMethod: HTTPMethod? = .get, body : Codable? = nil) {
        self.path = path
        self.parameters = parameters
        self.httpMethod = httpMethod
        if let body = body {
            let jsonEncoder = JSONEncoder()
            do {
                let jsonData = try jsonEncoder.encode(body)
                if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    print(jsonDict)
                    self.parameters = jsonDict
                }
            } catch {
                print("Failed to encode body to JSON: \(error)")
            }
        }
    }
    
}
