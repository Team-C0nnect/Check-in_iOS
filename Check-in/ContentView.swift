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
        
        NavigationView {
            CustomTabView {
                MovieVoteView()
                    .customTabItem("영화 투표", "play.tv.fill", Color.white)
                MainView()
                    .customTabItem("홈", "house.fill", Color.white)
                SleepOverView(date: Date.now)
                    .customTabItem("외박 신청", "figure.walk", Color.white)
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


