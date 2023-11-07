//
//  MovieRequestAction.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/7/23.
//

import Foundation
import Alamofire

class MovieRequest {
    
    func movieRequest(title: String) {
        let url: String = "http://43.202.136.92:8080"
        
        let header: HTTPHeaders = ["Accept": "application/json;charset=UTF-8"]
        
        AF.request("\(url)/movie",
                   method: .post,
                   parameters: ["title": title] as Dictionary,
                   encoding: JSONEncoding(),
                   headers: header)
        .validate(statusCode: 201...204)
        .response { response in
            switch response.result {
            case .success(let data):
                print("succes")
            case .failure(let error):
                print("\(error)")
            }
        }
                   
        
    }
}

