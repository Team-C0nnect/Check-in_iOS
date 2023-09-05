//
//  ContentView.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var viewName: String = "홈"
    var body: some View {
        ZStack {
            NavigationView {
                TabView(selection: $viewName) {
                    MovievoteView()
                        .tabItem {
                            Label(title: { Text("영화투표") },
                                  icon: { Image(systemName: "popcorn") })
                                
                        }
                        .tag("영화투표")
                        
                    
                    MainView()
                        .tabItem {
                            Label(
                                title: { Text("홈") },
                                icon: { Image(systemName: "house") })
                        }
                        .tag("홈")
                    
                    SleepoverView(date: Date())
                        .tabItem {
                            Label(
                                title: { Text("외박신청") },
                                icon: { Image(systemName: "door.left.hand.open") })
                        }
                        .tag("외박신청")
                    
                }
                .navigationBarItems(leading: Text("\(viewName)")
                    .padding(.leading, 10)
                    .font(Font.custom("Apple SD Gothic Neo", size: 20))
                    .fontWeight(.semibold))
                
                
                .navigationBarItems(trailing:
                    Button(action: {}) {
                        Text("≡")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                })
            }
        }
    }
    
}

#Preview {
    ContentView()
}


