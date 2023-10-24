//
//  SignInRegisterCell.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/17/23.
//

import SwiftUI

struct SignInRegisterCell: View {
    
    let title: String
    @Binding var text: String
    
    init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
            TextField("", text: $text)
                
                .textInputAutocapitalization(.never)
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .background(
                    Color("KindaGray")
                        .clipShape(RoundedRectangle(cornerRadius: 15))
    
                )
                
        }
        .padding(.horizontal, 30)
    }
}


