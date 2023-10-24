//
//  SignInRegisterView.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/17/23.
//

import SwiftUI

struct SignInRegisterView: View {
    @State var name: String = ""
    var body: some View {
        ZStack {
            Color("LightGray")
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 5) {
                    Text("Check in")
                        .font(.custom("Apple SD Gothic Neo", size: 40).weight(.bold))
                        .foregroundStyle(.linearGradient(colors: [Color("titleLinear1"), Color("titleLinear2"), Color("titleLinear3")], startPoint: .top, endPoint: .bottom))
                    
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 60)
                    
                }
                .padding(.top, 40)
                
                SignInRegisterCell(title: "이름", text: $name)
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    SignInRegisterView()
}
