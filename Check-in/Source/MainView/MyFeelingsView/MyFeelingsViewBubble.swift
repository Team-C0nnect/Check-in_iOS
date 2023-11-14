//
//  MyFeelingsViewBubble.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/14/23.
//

import SwiftUI

struct Triangle: Shape {
    
    
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
    }
    
}

struct MyFeelingsViewBubble: View {
    var body: some View {
        
        
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .foregroundStyle(.clear)
                    .frame(width: 160, height: 80)
                    .overlay(
                        VStack(spacing: 20) {
                            Text("확실하면 다시 클릭해주세요!")
                                .font(.custom("Apple SD Gothic Neo", size: 15).weight(.semibold))
                            
                        }
                        
                    )
                
                
            }
            
            Triangle()
                .stroke(Color.black, lineWidth: 1)
                .foregroundStyle(.clear)
                .frame(width: 18, height: 12)
            Rectangle()
                .frame(width: 150, height: 120)
                .foregroundColor(Color.white.opacity(0))
        }
        
    }
    
}

#Preview {
    MyFeelingsViewBubble()
}
