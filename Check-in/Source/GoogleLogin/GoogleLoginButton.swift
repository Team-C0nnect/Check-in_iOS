//
//  GoogleLoginButton.swift
//  Check-in
//
//  Created by dgsw8th16 on 9/12/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import Alamofire

struct GoogleLoginButton: View {
    
    @StateObject var googleLogin = GoogleLoginAction.shared
    
    
    var body: some View {
        GoogleSignInButton() {
            googleLogin.googleLogin()
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
        
    }
    
}

