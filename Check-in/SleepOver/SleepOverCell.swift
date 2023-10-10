//
//  SleepOverCell.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/6/23.
//

import SwiftUI

struct SleepOverCell: View {
    
    @State var date: Date = Date.now
    @State var showDatePicker: Bool = false
    
    let title: String
    let dateFormatter = DateFormatter()
    
    init(_ title: String) {
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.title = title
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(Font.custom("Apple SD Gothic Neo", size: 20).weight(.semibold))
            
            Rectangle()
                .onTapGesture {
                    self.showDatePicker.toggle()
                }
            
                .frame(width: 333, height: 60, alignment: .center)
            
                .foregroundColor(Color("KindaGray"))
            
                .overlay {
                    Text("\(dateFormatter.string(from: date))")
                        .foregroundStyle(Color.init(red: 0/255, green: 0/255, blue: 70/255))
                        .font(Font.custom("Apple SD Gothic Neo", size: 16).weight(.semibold))
                    
                }
                .cornerRadius(15)
            
            if showDatePicker {
                DatePicker("", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(Color.init(red: 0/255, green: 0/255, blue: 70/255))
            }
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 9)
        
        
    }
    
    
}

#Preview {
    SleepOverCell("이승혁 꼬추")
}
