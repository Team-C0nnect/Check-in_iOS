//
//  Constants.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation

public struct Constants {
    
    
    public static let baseUrl = "http://43.202.136.92:8080"
    
    
    
    public struct Parameters {
       
    }
    
    
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case refreshToken = "refreshToken"
    }
    
    
    public enum ContentType: String {
        case json = "application/json"
    }
    
}
