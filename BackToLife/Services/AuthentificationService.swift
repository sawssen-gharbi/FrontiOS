//
//  AuthentificationService.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 12/4/2023.
//

import Foundation
import GoogleSignIn
import SwiftUI


fileprivate struct LoginResponse: Codable {
    var token: String?
    var email: String?
    var statusCode: Int?
    var message: String?
    var _id: String?

}

fileprivate struct LoginBodyParams: Codable {
    var email: String
    var password: String
    
    init(email: String,password: String) {
        self.email = email
        self.password = password
    }
}




class AuthenticationService {
    
    

    //google login
        func handleSignInButton() {
            let signInConfig = GIDConfiguration.init(clientID: "417358432605-rlr6vbs5u79cnkp0bshg214be3khe92o.apps.googleusercontent.com")
        
        GIDSignIn.sharedInstance.configuration = signInConfig;
            GoogleSignIn.GIDSignIn.sharedInstance.signIn(
            withPresenting: ApplicationUtility.rootViewController) { signInResult, error in
                guard signInResult != nil else {
                // Inspect error
                return
              }
                let userFullName = signInResult?.user.profile?.name
                UserDefaults.standard.set(userFullName, forKey: "userFullName")
                
                let storyboard = UIStoryboard(name: "LoginGoogleView", bundle: nil)
                           let loginGoogleViewController = storyboard.instantiateViewController(withIdentifier: "LoginGoogleViewController") as! LoginGoogleViewController
                           ApplicationUtility.rootViewController.present(loginGoogleViewController, animated: true, completion: nil)
            }
          
        }
        
    
    public func _login(_ email: String, _ password: String ) async throws -> String {
        let apiEndpoint = URL(string: "http://localhost:7001/user/login")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        let bodyParams = LoginBodyParams(email: email , password: password)
        
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)

      
        
            let decoded = try JSONDecoder().decode(LoginResponse.self, from: responseData)
            // print("decoded", decoded)
        
            //userdefault
            let userId = decoded._id
            print("user id", userId)
            UserDefaults.standard.set(userId, forKey: "userId")

            
        if decoded.statusCode != 201 {
           
                   if decoded.message != nil {
                       throw AuthenticationError(status_code: decoded.statusCode! , serverMessage: decoded.message!)
                       
                   }
                   throw AuthenticationError(status_code: decoded.statusCode!, serverMessage: "Could not login ")
               }
        
   
               
               return decoded.token!
    
        
    }
    
   
    
    // Errors
    public struct AuthenticationError: LocalizedError {
        public let status_code: Int?
        public var errorDescription: String?
        
        init(status_code: Int, serverMessage: String) {
            self.status_code = status_code
            self.errorDescription = serverMessage
        }
    }
}
