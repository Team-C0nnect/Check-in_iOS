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
    
    @StateObject var googleLogin = GoogleLoginAction.shared
    
    var body: some View {
        VStack {
            ScrollView {
                if let movieList = movieResearch.movieList {
                    ForEach(movieList, id: \.self) { movie in
                        if movie.genreAlt != "성인물(에로)" {
                            HStack {
                                
                                Text("\(movie.movieNm)")
                                
                                Button {
                                    MovieRequest().movieRequest(token: googleLogin.tokenData.accessToken, title: movie.movieNm)
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
            GoogleLoginButton()
            
        }
        .onAppear {
            movieResearch.movieReserch()
            
        }
        
        
        
    }
    
}


#Preview {
    MovieRequestView()
}
