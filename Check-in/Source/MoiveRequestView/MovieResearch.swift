//
//  MovieResearch.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/1/23.
//

import SwiftUI
import Alamofire

class MovieResearch: ObservableObject {
    @Published var movieList: [MovieModel]? = nil
    
    func movieReserch() {
        let url: String = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
        
        lazy var params: Parameters = [
            "key" : KobisKey().key,
            "movieNm" : ""
            ]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default)
        .responseDecodable(of: MovieListResult.self) { response in
            switch response.result {
            case .success(let data):
                
                self.movieList = data.movieListResult.movieList
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
