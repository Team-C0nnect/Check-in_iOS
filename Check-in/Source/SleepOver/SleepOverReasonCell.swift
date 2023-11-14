//
//  SleepOverReasonView.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/12/23.
//

import SwiftUI

struct SleepOverReasonCell: View {
    @State private var text = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Text("외박 사유")
                .font(Font.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))            
            
            ZStack(alignment: .topLeading) {
                let placeholder: String="외박 사유를 적어주세요."
                
                TextEditor(text: $text)
                    .frame(width: 330, height: 100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.kindaGray)
                    }
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
                
                if text.isEmpty {
                    Text(placeholder)
                        .padding(10)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

#Preview {
    SleepOverReasonCell()
}
