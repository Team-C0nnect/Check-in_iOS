//
//  SleepOverReasonView.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/12/23.
//

import SwiftUI

struct SleepOverReasonCell: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("외박 사유")
                .font(Font.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
            
            
            Rectangle()
                .frame(width: 333, height: 120, alignment: .center)
                .foregroundColor(Color("KindaGray"))
                .cornerRadius(15)
        }
    }
}

#Preview {
    SleepOverReasonCell()
}
