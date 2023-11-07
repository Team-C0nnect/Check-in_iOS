//
//  MovieResModel.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/31/23.
//

import SwiftUI

struct MovieListResult: Codable {
    let movieListResult: MovieList
}

struct MovieList: Codable {
    let totCnt: Int
    let source: String
    let movieList: [MovieModel]
}

struct MovieModel: Codable, Hashable {
    let movieCd: String
    let movieNm: String
    let movieNmEn: String
    let prdtYear: String
    let openDt: String
    let typeNm: String
    let prdtStatNm: String
    let nationAlt: String
    let genreAlt: String
    let repNationNm: String
    let repGenreNm: String
    let directors: [MovieDirectors]
    let companys: [Companys]
}

struct MovieDirectors: Codable, Hashable {
    let peopleNm: String
}

struct Companys: Codable, Hashable {
    let companyCd: String
    let companyNm: String
}
