//
//  MovieRequestView.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/24/23.
//

import SwiftUI
import Alamofire


struct MovieRequestView: View {
    @StateObject private var movieResearch = MovieResearch()
    var body: some View {
        ScrollView {
            if let movieList = movieResearch.movieList {
                ForEach(movieList, id: \.self) { movie in
                    if movie.genreAlt != "성인물(에로)" {
                        HStack {
                            
                            Text("\(movie.movieNm)")
                            
                            Button {
                                MovieRequest().movieRequest(title: movie.movieNm)
                            } label: {
                                Text("신청")
                            }
                            .tint(
                                Color.blue
                            )
                            
                        }
                    }
                }
            }
            
        }
        .onAppear {
            movieResearch.movieReserch()
        }
    }
    
}


#Preview {
    MovieRequestView()
}
