//
//  GoogleLoginAction.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/19/23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseInAppMessaging
import FirebaseMessaging
import UserNotifications
import Alamofire
import GoogleSignIn
import GoogleSignInSwift



struct GoogleLoginAction {
    
    func googleLogin() {
        
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            if (signInResult != nil) {
                Messaging.messaging().token { token, error in
                    
                    if let fcmToken = token {
                        
                        
                        ApiClient.request(ApiRouter(requestConfigurator: RequestConfigurator(path: "/auth", httpMethod: .post, body: ["idToken":signInResult?.user.idToken?.tokenString ?? "", "fcmToken":fcmToken] as Dictionary))) { (result : Result<GoogleLoginModel?, ApiError>) in
                            switch result {
                            case .success(let data):
                                if let token = data {
                                    guard StorageManager.shared.createTokens(token) else {
                                        print("실패")
                                        return
                                    }
                                }
                            case .error(let error):
                                print(error)
                            }
                            
                        }
                        
                        //                        AF.request("\(url)/auth",
                        //                                   method: .post,
                        //                                   parameters: ["idToken":signInResult?.user.idToken?.tokenString ?? "", "fcmToken":fcmToken] as Dictionary,
                        //                                   encoding: JSONEncoding(),
                        //                                   headers: header)
                        //
                        //                        .response { response in
                        //                            switch response.result {
                        //                            case .success(let get):
                        //                                print("POST 성공")
                        //                                do {
                        //                                    let tokens = try decoder.decode(GoogleLoginModel.self, from: get!)
                        //                                    guard StorageManager.shared.createTokens(tokens) else {
                        //                                        print("실패")
                        //                                        return
                        //                                    }
                        //
                        //
                        //                                }
                        //                                catch (_) {
                        //
                        //                                }
                        //                            case .failure(let error):
                        //                                print("에러 : \(error)")
                        //
                        //                            }
                        //
                        //                        }
                        
                    }
                    
                    
                    
                    
                    
                }
            }
            
        }
        
        
    }
    
    func refresh() {
        let url: String = "http://43.202.136.92:8080"
        
        
        AF.request("\(url)/auth/refresh",
                   method: .post,
                   parameters: ["refreshToken": StorageManager.shared.readTokens()?.refreshToken ?? " "],
                   encoding: JSONEncoding())
        .responseDecodable(of: GoogleLoginModel.self) { response in
            switch response.result {
            case .success(let data):
                guard StorageManager.shared.updateTokens(data) else {
                    print("실패")
                    return
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
}
