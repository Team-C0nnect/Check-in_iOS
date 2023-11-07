//
//  LogoView.swift
//  Check-in
//
//  Created by dgsw8th32 on 10/31/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Text("Check in")
            .font(.custom("Apple SD Gothic Neo", size: 30))
            .fontWeight(.bold)
            .foregroundStyle(Color(red: 0/255, green: 1/255, blue: 50/255))
    }
}

#Preview {
    LogoView()
}
