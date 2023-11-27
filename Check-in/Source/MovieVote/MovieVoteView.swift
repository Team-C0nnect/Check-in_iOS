//
//  MovieVote.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct MovieVoteView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    MovieRequestView()
                        
                } label: {
                    Text("w")
                       
                }
                
                
                MovieTabView()
            }
            
        }
        
          
    }
    
}


struct MovieVote_Previews: PreviewProvider {
    static var previews: some View {
        MovieVoteView()
    }
}
