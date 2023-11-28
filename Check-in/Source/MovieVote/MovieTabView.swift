//
//  MovieTabView.swift
//  MovieVote
//
//  Created by dgsw8th32 on 11/9/23.
//

import SwiftUI

struct MovieItem: Identifiable, Hashable {
    var id: Int = 0
    var toggle: Bool = false
}

struct MovieTabView: View {
    
    @State var movies: [MovieItem] = Array(repeating: MovieItem(), count: 10)
    
    
    
    @State var selection: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $selection) {
                
                ForEach(movies) { index in
                    MovieItemView()
                        .tag(index.id)
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            
            
            
            
            Button {
                movies[selection].toggle.toggle()
                
                print(movies[selection])
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: movies[selection].toggle ? "checkmark.circle.fill" : "checkmark.circle")
                        .font(.custom("Apple SD Gothic Neo", size: 25))
                    
                    Text(movies[selection].toggle ? "투표완료" : "투표하기")
                        .font(.custom("Apple SD Gothic Neo", size: 25))
                }
                .foregroundStyle(.white)
                .frame(width: 350, height: 60)
                .background(movies[selection].toggle ? Color.gray : Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            
            Spacer(minLength: 50)
        }
        
    }
    
    
}

#Preview {
    MovieTabView()
    
}
