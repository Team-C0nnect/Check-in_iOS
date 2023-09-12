//
//  CustomTabView.swift
//  Check-in
//
//  Created by dgsw8th32 on 2023/09/12.
//

import SwiftUI

struct CustomTabView: View {
    
    @State var selected: Int = 0
    let content: [CustomTabItem]
    
    init(@CustomTabViewBuilder content: () -> [CustomTabItem]) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ForEach(0..<content.count) { idx in
                if idx == selected {
                    content[idx].content
                        .frame(maxHeight: .infinity)
                }
            }
            
            HStack {
                Spacer()
                ForEach(0..<content.count) { idx in
                    CustomButtonView(content[idx].title, content[idx].image, content[idx].color, idx == selected) {
                        selected = idx
                    }
                    Spacer()
                }
            }
            .frame(height: 51)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .ignoresSafeArea()
            
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView {
            MovieVoteView()
                .customTabItem("홈", "house", Color.white)
        }
    }
}
