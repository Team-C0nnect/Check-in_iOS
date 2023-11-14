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
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0 )
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
                .padding(.trailing, 68)
            
            Button(action: {withAnimation {showMenu = true}}, label: {
                ZStack {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 40))
                        .foregroundStyle(.black)
                }
            })
            .padding(.trailing)
        }
    }}