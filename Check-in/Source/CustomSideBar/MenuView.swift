//
//  MenuView.swift
//  SideBar
//
//  Created by dgsw8th32 on 10/24/23.
//

import SwiftUI

extension Text {
    func textModifier() -> some View {
        self
            .foregroundStyle(.white)
            .font(.title.weight(.semibold))
            .padding(.leading, 10)
    }
}

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("minho")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                Button(action: {withAnimation{showMenu = false}}) {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                }
            }
            
            Text("1114")
                .textModifier()
            
            Text("신민호")
                .textModifier()
                
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(Color.init(red: 0/255, green: 1/255, blue: 32/255))
    }
}

#Preview {
    MenuView(showMenu: .constant(true))
}
