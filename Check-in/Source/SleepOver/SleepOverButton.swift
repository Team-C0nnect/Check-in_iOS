//
//  SleepOverButton.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/12/23.
//

import SwiftUI

struct SleepOverButton: View {
    var body: some View {
        Button(action: {print("외박 신청")}) {
            RoundedRectangle(cornerRadius: 15)
                .overlay {
                    Text("신청")
                        .font(Font.custom("Apple SD Gothic Neo", size: 20).weight(.medium))
                  .foregroundStyle(.white)
                }
        }
        .frame(width: 333, height: 50)
        .background(Color("MainColor"))
        .clipShape(RoundedRectangle(cornerRadius: 15))

            

    }
}

#Preview {
    SleepOverButton()
}
