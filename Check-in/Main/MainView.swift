//
//  ContentView.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            MainViewCell(label: "최근 외박 신청")
                .padding(.bottom, 42)
            MainViewCell(label: "출석 체크 여부")
            
            Spacer()
        }
        .padding(.vertical, 20)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
