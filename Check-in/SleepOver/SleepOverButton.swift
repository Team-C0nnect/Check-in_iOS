//
//  SleepOverButton.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/12/23.
//

import SwiftUI

struct SleepOverButton: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("KindaGray"))
            .frame(width: 333, height: 50)
            .overlay {
                Text("신청")
                    .font(Font.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
            }
            

    }
}

#Preview {
    SleepOverButton()
}
