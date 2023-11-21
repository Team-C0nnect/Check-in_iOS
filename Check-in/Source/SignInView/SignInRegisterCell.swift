//
//  SignInRegisterCell.swift
//  SignInView
//
//  Created by dgsw8th32 on 11/7/23.
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
                .foregroundStyle(Color(red: 0/255, green: 1/255, blue: 32/255))
            
            TextField("", text: $text)
                .textInputAutocapitalization(.never)
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .background(
                    Color(red: 217/255, green: 217/255, blue: 217/255)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
    
                )
                .padding(.bottom)
                
        }
        .padding(.horizontal, 30)
    }
}
