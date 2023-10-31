//
//  MovieRequestView.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/24/23.
//

import SwiftUI
import Alamofire

struct MovieRequestView: View {
    let url: String = "https://openapi.naver.com/v1/search/movie.json"
    let hearder: HTTPHeaders = [
        "X-Naver-Client-Id": "",
        "X-Naver-Client-Secret": ""
    ]
    var query: String = "매드맥스"
    
    lazy var params: Parameters = [
        "query": query
    ]
    
    mutating func movieReserch() {
        AF.request(url,
                   method: .get,
                   parameters: params
                   
        ).response { _ in
            
        }
    }
    
    var body: some View {
        Text("")
    }
    
}

#Preview {
    MovieRequestView()
}
