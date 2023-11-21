//
//  SignInRegisterView.swift
//  SignInView
//
//  Created by dgsw8th32 on 11/7/23.
//

import SwiftUI

struct SignInRegisterView: View {
    @State var mail: String
    @State var name: String
    @State var num: String
    
    var body: some View {
        VStack {
            LogoView()
                .padding(.bottom, -5)
            
            Divider()
                .padding(.horizontal, 70)
                .padding(.bottom, 50)
            
            SignInRegisterCell(title: "이메일", text: $mail)
            SignInRegisterCell(title: "이름", text: $name)
            SignInRegisterCell(title: "학번", text: $num)
            
            Spacer()
            
            RegisterButtonView()
            
            Spacer()
        }
        .background(
            Color(red: 230/255, green: 230/255, blue: 230/255)
        )
    }
}

#Preview {
    SignInRegisterView(mail: "", name: "", num: "")
}
