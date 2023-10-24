//
//  ContentView.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI
import CodeScanner

struct MainView: View {
    
    @State private var scannedCode: String?
    @State private var isShowingScanner = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                MainViewCell(label: "출석 체크 여부", content: AnyView(HStack(spacing: 0) {
                    Text("미완료")
                        .font(.custom("Apple SD Gothic Neo", size: 32).weight(.bold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingScanner = true
                    }) {
                        VStack {
                            
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            
                            Text("출첵하기")
                                .font(.custom("Apple SD Gothic Neo", size: 16).weight(.bold))
                                .foregroundStyle(Color.black)
                        }
                    }
                    
                }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 20))
                )
                .padding(.top, 40)
                
                MainViewCell(label: "최근 외박 신청")
                
            }
        }
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    scannedCode = result.string
                    isShowingScanner = false
                    print(scannedCode ?? "")
                }
            }
            
        }
        
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
