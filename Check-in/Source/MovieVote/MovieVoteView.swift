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
        VStack {
            if isMovieVote {
                MovieTabView()
            }
            else {
                MovieRequestView()
            }
            
        }
    }
}


#Preview {
    
    MovieVoteView()
}
