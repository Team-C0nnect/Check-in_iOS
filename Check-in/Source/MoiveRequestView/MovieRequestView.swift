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
                            VStack(spacing: 0) {
                                Divider()

                                
                                HStack() {
                                    
                                    Text("\(movie.movieNm)")
                                        .font(.custom("Apple SD Gothic Neo", size: 20).weight(.bold))
                                        .padding(.vertical)
                                    
                                    Spacer()
                                    
                                    Button {
                                        MovieRequest().movieRequest(token: googleLogin.tokenData.accessToken, title: movie.movieNm)
                                    } label: {
                                        HStack(spacing: 5) {
                                            Text("신청")
                                            Image(systemName: "checkmark.circle.fill")
                                        }
                                        .padding(10)
                                        .foregroundStyle(.white)
                                        .font(.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
                                        .background(Color(red: 0/255, green: 1/255, blue: 70/255))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .padding(.horizontal)
                                           
                                    }
                                }
                            }
                            .padding(.horizontal)
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
