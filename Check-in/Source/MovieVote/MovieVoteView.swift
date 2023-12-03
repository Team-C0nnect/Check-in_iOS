//
//  MovieVote.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI




struct MovieVoteView: View {
    @State var isMovieVote: Bool = true
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    MovieRequestView()
                } label: {
                    Text("영화신청하고 싶다면?")
                }
                .navigationBarBackButtonHidden()
                
                MovieTabView()
            }
        }
    }
}


#Preview {
    
    MovieVoteView()
}
