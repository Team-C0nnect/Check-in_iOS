//
//  ButtonView.swift
//  SignInView
//
//  Created by dgsw8th32 on 11/7/23.
//

import SwiftUI

struct RegisterButtonView: View {
    var body: some View {
        Rectangle()
            .frame(width: 111, height: 59)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundStyle(Color(red: 0/255, green: 1/255, blue: 32/255))
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .overlay {
                Button("회원가입", action: {
                    print("신민호 꼬추")
                })
                    .foregroundStyle(.white)
                    .font(.title3)
            }
    }
}

#Preview {
    RegisterButtonView()
}
