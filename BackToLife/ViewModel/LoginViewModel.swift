//
//  UsersViewModel.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 12/4/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

extension LoginView {
    @MainActor class ViewModel: NSObject, ObservableObject {
      
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var authSuccessful: Bool = true
        @Published var errorMessage: String = ""
        @Published var isLoading: Bool = false
        
        
        //google
        @Published var isLoginSuccessed = false
        
        func attemptLoginGoogle(){
            AuthenticationService().handleSignInButton()
        }
        
        
        
        // login
        func attemptLogin(userData: UserData) async {
            isLoading = true
            self.isLoginSuccessed = true
            defer {
                isLoading = false
            }
            do {
                let tokenRes = try await AuthenticationService()._login(email, password)
                userData.token = tokenRes
               // print(tokenRes)
               
        
            } catch let error {
                if type(of: error) == AuthenticationService.self.AuthenticationError.self {
                    errorMessage = error.localizedDescription
                } else {
                    print("Application error: ", error.localizedDescription)
                    errorMessage = "Connection error"
                }
                authSuccessful = false
            }
        }
        
        
        
       
        
        
    
    }
}
