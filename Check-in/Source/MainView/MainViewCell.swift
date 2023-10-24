//
//  MainViewCell.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct MainViewCell: View {
    
    let label: String
    let content: AnyView
    
    init(label: String, content: AnyView = AnyView(Text(""))) {
        self.label = label
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("\(label)")
                .font(Font.custom("Apple SD Gothic Neo", size: 32))
                .fontWeight(.bold)
            
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 336, height: 224)
                .foregroundColor(Color("KindaGray"))
                .overlay(content)
                
        }
        
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(label: "신민호", content: AnyView(Text("이승혁지찌")))
    }
}
