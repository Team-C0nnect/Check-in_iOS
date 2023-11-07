//
//  MenuView.swift
//  SideBar
//
//  Created by dgsw8th32 on 10/24/23.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {withAnimation{showMenu = false}}) {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.init(red: 0/255, green: 1/255, blue: 32/255))
    }
}
