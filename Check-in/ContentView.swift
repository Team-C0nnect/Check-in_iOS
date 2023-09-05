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
                    MovieVoteView()
                        .tabItem {
                            Label(title: { Text("영화투표") },
                                  icon: { Image(systemName: "play.tv") })
                            
                        }
                        .tag("영화투표")
                    
                    
                    MainView()
                        .tabItem {
                            Label(
                                title: { Text("홈") },
                                icon: { Image(systemName: "house") })
                        }
                        .tag("홈")
                    
                    SleepOverView(date: Date())
                        .tabItem {
                            Label(
                                title: { Text("외박신청") },
                                icon: { Image(systemName: "figure.walk") })
                        }
                        .tag("외박신청")
                    
                }
                
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


