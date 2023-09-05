//
//  SleepOver.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct SleepOverView: View {
    @State var date: Date
    let range = Date.now ... Date.now.addingTimeInterval(60*60*24*60)
    var body: some View {
        DatePicker("Datepicker", selection: $date, in: range, displayedComponents: .date)
            .padding(.horizontal, 10)
            
            
    }
    
}

#Preview {
    SleepOverView(date: Date())
}
