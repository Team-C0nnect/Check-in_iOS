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
    
    @StateObject var googleLogin = GoogleLoginAction.shared

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
                    print(scannedCode ?? "")
                    
                    print(googleLogin.tokenData.accessToken)
                    let url: String = "http://43.202.136.92:8080"
                    
                    let header: HTTPHeaders = [
                        .authorization(bearerToken: googleLogin.tokenData.accessToken)
                    ]
                    
                    AF.request("\(url)/attendance",
                               method: .post,
                               parameters: ["code" : scannedCode ?? " "],
                               encoding: JSONEncoding(),
                               headers: header)
                    .responseDecodable(of: ErrorCode.self) { response in
                        switch response.result {
                        case .success(let data):
                            print("\(data)")
                        case .failure(let error):
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
