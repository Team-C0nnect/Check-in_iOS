//
//  CustomButtonView.swift
//  Check-in
//
//  Created by dgsw8th32 on 2023/09/12.
//

import SwiftUI

struct CustomButtonView: View {
    
    let title: String
    let image: String
    let color: Color
    
    let selected: Bool
    let action: () -> ()

    
    init(_ title: String, _ image: String, _ color: Color, _ selected: Bool, action: @escaping () -> ()) {
        self.title = title
        self.image = image
        self.color = color
        self.selected = selected
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(title)
                    .fontWeight(.bold)
            }
        }
        .foregroundColor(color)
        .padding(.top, 15)
    }
}
