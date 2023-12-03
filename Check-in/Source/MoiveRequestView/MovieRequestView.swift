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
    
    @State var search: String = ""
    
    let storageManager = StorageManager.shared
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                TextField("", text: $search)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(10)
                    .onSubmit {
                        movieResearch.movieReserch(movieNm: search)
                    }
                
                
                Button {
                    movieResearch.movieReserch(movieNm: search)
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                }
                .tint(Color.white)
            }
            .padding(.horizontal, 10)
            .background(Color.accentColor)
            .onAppear {
                movieResearch.movieReserch()
            }
            
            ScrollView {
                if let movieList = movieResearch.movieList {
                    ForEach(movieList, id: \.self) { movie in
                        if !movie.genreAlt.contains("성인물(에로)") && movie.genreAlt != "" {
                            VStack(spacing: 0) {
                                Divider()
                                
                                HStack() {                                    Text("\(movie.movieNm), \(movie.genreAlt)")
                                        .font(.custom("Apple SD Gothic Neo", size: 20).weight(.bold))
                                        .padding(.vertical)
                                    
                                    Spacer()
                                    
                                    Button {
                                        MovieRequest().movieRequest(token: storageManager.readTokens()?.accessToken ?? " ", title: movie.movieNm)
                                    } label: {
                                        HStack(spacing: 5) {
                                            Text("신청")
                                            Image(systemName: "checkmark.circle.fill")
                                        }
                                        .padding(10)
                                        .foregroundStyle(.white)
                                        .font(.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
                                        .background(Color.accentColor)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                        
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    
                    Image(systemName: "chevron.left")
                    
                        .font(.custom("Apple SD Gothic Neo", size: 15))
                }
                .tint(Color.white)
            }
        }
        
    }
    
}


#Preview {
    MovieRequestView()
}
