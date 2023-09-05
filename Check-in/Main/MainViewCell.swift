//
//  MainViewCell.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct MainViewCell: View {
    
    @State var label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("\(label)")
                .font(Font.custom("Apple SD Gothic Neo", size: 32))
                .fontWeight(.bold)
            
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 336, height: 224)
                .foregroundColor(Color("KindaGray"))
        }
        
    }
}

#Preview {
    MainViewCell(label: "이승혁 꼬추")
}
