//
//  MyFeelingsView.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/14/23.
//

import SwiftUI
import Alamofire

struct MyFeelingsView: View {
    
    enum Feel: String {
        case good = "good"
        case bad = "bad"
        case sad = "sad"
        case angry = "angry"
        case perfect = "perfect"
        case sick = "sick"
        
        var emoji: String {
            switch self {
            case .good:
                return "☺️"
            case .bad:
                return "😔"
            case .sad:
                return "😭"
            case .angry:
                return "😡"
            case .perfect:
                return "😍"
            case .sick:
                return "🤒"
            }
        }
        
        var subtitle: String {
            switch self {
            case .good:
                return "좋아요!"
            case .bad:
                return "나빠요."
            case .sad:
                return "슬퍼요.."
            case .angry:
                return "화나요!!"
            case .perfect:
                return "완벽해요!!"
            case .sick:
                return "아파요..."
            }
        }
        
        
    }
    
    let feels: [Feel] = [.perfect, .good, .bad, .sad, .angry, .sick]
    
    @State var isExist: Bool = false
    
    var body: some View {
        
        
        
        VStack(spacing: 20) {
            
            Text("그대들은 어떤 기분이신가요")
                .font(.custom("Apple SD Gothic Neo", size: 30))
            
            TabView {
                ForEach(0..<feels.count, id: \.self) { index in
                    
                    Button {
                        if isExist {
                            
                        }
                        
                        withAnimation {
                            isExist = true
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                isExist = false
                            }
                        }
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.black, lineWidth: 2)
                            .frame(width: 280)
                            .overlay {
                                ZStack {
                                    VStack(spacing: 30) {
                                        Text("\(feels[index].emoji)")
                                            .font(.custom("Apple SD Gothic Neo", size: 70))
                                        
                                        Text("\(feels[index].subtitle)")
                                            .font(.custom("Apple SD Gothic Neo", size: 40).weight(.semibold))
                                    }
                                    
                                    if isExist {
                                        VStack {
                                            MyFeelingsViewBubble()
                                            Spacer()
                                        }
                                        .padding(.vertical, 10)
                                        
                                    }
                                    
                                }
                            }
                    }
                    .onAppear {
                        isExist = false
                    }
                }
                
            }
            .frame(height: 380)
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
    }
}


#Preview {
    MyFeelingsView()
    
}
