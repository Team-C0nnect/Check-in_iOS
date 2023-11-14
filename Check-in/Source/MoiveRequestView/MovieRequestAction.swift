//
//  MovieRequestAction.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/7/23.
//

import SwiftUI
import Alamofire

struct CodeModel: Codable {
    let code: String
}

struct MovieRequest {
    
    func movieRequest(token: String, title: String) {
        
        let url: String = "http://43.202.136.92:8080"
        
        
        let header: HTTPHeaders = [
            .authorization(bearerToken: token)
            ]
        
        
        AF.request("\(url)/movie",
                   method: .post,
                   parameters: ["title": title],
                   encoding: JSONEncoding(),
                   headers: header)
            
        .validate(statusCode: 201...204)
        
        .response { response in
            switch response.result {
            case .success(_):
                print("succes")
            case .failure(let error):
                print("\(error)")
            }
        }
                   
        
    }
}

