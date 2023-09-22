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

    var body: some View {
        GoogleSignInButton {
            GoogleLoginAction().googleLogin()
        }
        
        
    }
    
}




#Preview {
    GoogleLoginButton()
}

