//
//  SleepOver.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct SleepOverView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("외박 신청")
                        .font(Font.custom("Apple SD Gothic Neo", size: 30).weight(.semibold))
                    Text("신청할 날짜와 사유를 적어주세요")
                        .font(Font.custom("Apple SD Gothic Neo", size: 14).weight(.semibold))
                }
                .padding(.leading, 30)
                Spacer()
            }
            VStack {
                SleepOverCell("외박 날짜")
                SleepOverCell("복귀 날짜")
                SleepOverReasonCell()
            }
            .padding(.top, 43)
            
            SleepOverButton()
                .padding(.top, 15)
            
        }
    }
}

struct SleepOver_PreView: PreviewProvider {
    static var previews: some View {
        SleepOverView()
    }
}
