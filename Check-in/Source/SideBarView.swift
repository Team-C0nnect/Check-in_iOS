//
//  ContentView.swift
//  SideBar
//
//  Created by dgsw8th32 on 10/17/23.
//

import SwiftUI

struct SideBarView: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < 500 {
                    withAnimation() {
                        showMenu = false
                    }
                }
            }
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                ContentView(tabIndex: .home, showMenu: $showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: showMenu ? geometry.size.width/1.4 : 0)
                    .disabled(showMenu ? true : false)
                
                if showMenu {
                    MenuView(showMenu: $showMenu)
                        .frame(width: geometry.size.width/1.5)
                        .transition(.move(edge: .leading ))
                }
            }
            .gesture(drag)
        }
    }
}

#Preview {
    SideBarView()
}
