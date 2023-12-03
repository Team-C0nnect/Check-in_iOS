//
//  CustomNavigationBarView.swift
//  Check-in
//
//  Created by dgsw8th32 on 10/31/23.
//

import SwiftUI

struct CustomNavigationBarView: View {

    @State private var isAnimated: Bool = false
    @Binding var showMenu: Bool

    var body: some View {
        HStack(alignment: .center) {
            Button(action: {withAnimation {
                showMenu = true
            }}, label: {
                ZStack {
                    Image(systemName: "text.justify")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
            })
            .padding(.leading, 25)
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0 )
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
                .padding(.trailing, 75)
            
            Spacer()
        }
    }}
