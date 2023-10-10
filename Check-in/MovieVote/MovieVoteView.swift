//
//  MovieVote.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct MovieVoteView: View {
    var body: some View {
            List {
                ForEach(1..<10) { _ in
                    
                    VStack(spacing: 15) {
                        Image("madmax")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        
                        
                        Text("매드맥스: 분노의 승혁")
                            .font(Font.custom("Apple SD Gothic Neo", size: 32))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                    }
                    
                    .padding(.vertical, 50)
                    .swipeActions(edge: .trailing) {
                        Button {
                            print("Hello, BongSeong!")
                        } label: {
                            Label("투표", systemImage: "checkmark.circle")
                        }
                        
                    }
                    .tint(.accent)
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
}


struct MovieVote_Previews: PreviewProvider {
    static var previews: some View {
        MovieVoteView()
    }
}
