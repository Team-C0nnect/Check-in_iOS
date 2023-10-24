//
//  SignInView.swift
//  Check-in
//
//  Created by dgsw8th16 on 10/17/23.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Color("LightGray")
                .ignoresSafeArea()
            
            VStack(spacing: 70) {
                
                
                VStack(spacing: 5) {
                    Text("Check in")
                        .font(.custom("Apple SD Gothic Neo", size: 40).weight(.bold))
                        .foregroundStyle(.linearGradient(colors: [Color("titleLinear1"), Color("titleLinear2"), Color("titleLinear3")], startPoint: .top, endPoint: .bottom))
                    
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal, 60)
                    
                }
                .padding(.bottom, 70)
                
                
                
                GoogleLoginButton()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 50)
                
                    
            }
        }
    }
}

#Preview {
    SignInView()
}
