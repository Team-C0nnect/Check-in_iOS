//
//  ContentView.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI

enum TabIndex {
    case movie, home, sleepOver
}

struct ContentView: View {
    
    
    @State var viewName: String = "홈"
    @State var tabIndex: TabIndex
    @Binding var showMenu: Bool
    
    func changeView(tabIndex: TabIndex) -> AnyView {
        switch tabIndex {
        case .movie:
            return AnyView(MovieVoteView())
        case .home:
            return AnyView(MainView())
        case .sleepOver:
            return AnyView(SleepOverView())
        }
    }
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                VStack {
                    CustomNavigationBarView(showMenu: $showMenu)
                        .padding(.bottom, 5)
                    
                    self.changeView(tabIndex: self.tabIndex)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        CustomButtonView("영화투표", "play.tv.fill",
                                         self.tabIndex == .movie ? Color.accentColor : Color.kindaGray,
                                         true,
                                         action: {
                            withAnimation() {
                                self.tabIndex = .movie
                            }
                        }
                        )
                        .frame(width: geometry.size.width / 3, height: 50)
                        
                        CustomButtonView("홈", "house.fill",
                                         self.tabIndex == .home ? Color.accentColor : Color.kindaGray,
                                         true,
                                         action: {
                            withAnimation() {
                                self.tabIndex = .home
                            }
                        }
                        )
                        .frame(width: geometry.size.width / 3, height: 50)
                        
                        CustomButtonView("외박신청", "powersleep",
                                         self.tabIndex == .sleepOver ? Color.accentColor : Color.kindaGray,
                                         true,
                                         action: {
                            withAnimation {
                                self.tabIndex = .sleepOver
                            }
                        }
                        )
                        .frame(width: geometry.size.width / 3, height: 50)
                    }
                }
            }
        }
    }
}
