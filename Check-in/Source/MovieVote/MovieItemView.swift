//
//  MovieItemView.swift
//  MovieVote
//
//  Created by dgsw8th32 on 11/9/23.
//

import SwiftUI

struct MovieItemView: View {
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 350, height: 450)
                .overlay {
                    LinearGradient(colors: [Color.pink, Color.cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
        }
    }
}

#Preview {
    MovieItemView()
}
