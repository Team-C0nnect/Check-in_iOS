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
    
    let url = "http://43.202.136.92:8080"
    
    let header: HTTPHeaders = ["Accept": "application/json;charset=UTF-8"]
    
    let decoder = JSONDecoder()
    
    public func googleLogin() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            print(Messaging.messaging().apnsToken);
            Messaging.messaging().token { token, error in
                
                if let fcmToken = token {
                    AF.request("\(url)/auth",
                               method: .post,
                               parameters: ["idToken":signInResult?.user.idToken?.tokenString ?? "", "fcmToken":fcmToken] as Dictionary,
                               encoding: JSONEncoding(),
                               headers: header)
                    
                    .response { response in
                        switch response.result {
                        case .success(let get):
                            print("POST 성공")
                            do {
                                let data = try decoder.decode(GoogleLoginModel.self, from: get!)
                                
                            }
                            catch (_) {
                                
                            }
                        case .failure(let error):
                            print("에러 : \(error)")
                            
                        }
                        
                    }
                }
                
                
                
            }
        }
        
    }
    
} 
