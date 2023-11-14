//
//  MovieTabView.swift
//  MovieVote
//
//  Created by dgsw8th32 on 11/9/23.
//

import SwiftUI

struct MovieTabView: View {
    @State var isPressed : Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                ForEach(1..<5) { _ in
                    
                    MovieItemView()
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .padding(.top, 60)
            
            
            Button(action: {
                    isPressed.toggle()
            }, label: {
                HStack(spacing: 0) {
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                    
                    Text(isPressed ? "투표완료" : "투표하기")
                        .font(.title)
                }
                .foregroundStyle(.white)
                .frame(width: 350, height: 70)
                .background(isPressed ? Color.gray : Color(red: 0/255, green: 1/255, blue: 32/255))
                .cornerRadius(12)
                .padding(.bottom, 50)
            })
        }
    }
}

#Preview {
    MovieTabView()

}
