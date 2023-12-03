//
//  ContentView.swift
//  Check-in
//
//  Created by dgsw8th16 on 8/30/23.
//

import SwiftUI
import CodeScanner
import Alamofire

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
                        .onAppear {
                            ApiClient.request(ApiRouter(requestConfigurator: RequestConfigurator(path: "/attendance/confirm", httpMethod: .get, body: nil))) { (result : Result<String?, ApiError>) in
                                switch result {
                                case .success(let data):
                                    print(data)
                                case .error(let error):
                                    print(error)
                                }
                                
                            }
                        }
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingScanner = true
                    }) {
                        VStack {
                            
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Color.accentColor)
                            
                            
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

                    ApiClient.request(ApiRouter(requestConfigurator: RequestConfigurator(path: "/attendance", parameters: ["code": scannedCode ?? " "], httpMethod: .post, body: nil))) { (result: Result<ErrorCode, ApiError>) in
                        switch result {
                        case .success(let code):
                            print("\(code)")
                        case .error(let error):
                            print("\(error)")
                        }
                        
                    }
                    
                    
                    
                    
                    isShowingScanner = false
                    
                    
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

struct ErrorCode: Codable {
    let message: String
}
