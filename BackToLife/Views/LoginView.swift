//
//  login.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 20/3/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    
    @EnvironmentObject var userData: UserData
    @StateObject private var viewModel = ViewModel()
    
    @State  var email: String = ""
    @State  var password: String = ""
    @State var emailIsValid: Bool = true
    @State private var isLoggedIn = false
    
    @State private var showLoginGoogleView = false
    
    //186991793457-48c41p24gv1rtucaiqt32mktgpgm3g0p.apps.googleusercontent.com
   
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack {
                    Color("Grey").edgesIgnoringSafeArea(.all)
                    VStack {
                        
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                        
                        Image(uiImage: #imageLiteral(resourceName: "hey"))
                            .resizable()
                            .frame(width: 300 , height: 200)
                        
                        
                        Spacer()
                        
                        
                        
                        
                        
                        CaptionedTextField(caption: "Email Address", text: $viewModel.email, placeholder: "Enter your email")
                            .padding([.top], 20)
                        ViewableSecureField(caption: "Password", text: $viewModel.password, placeholder: "Enter your password")
                            .padding([.top], 5)
                        if viewModel.errorMessage != "" {
                            Text(viewModel.errorMessage)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.red)
                        }
                        
                        
                        
                        //PrimaryButton(title: "Login")
                        Button(action: {
                            Task {
                                let result: () = try await viewModel.attemptLogin(userData: self.userData )
                                isLoggedIn = true // set isLoggedIn to true if login is successful
                            }
                        }) {
                            Text("Login")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor( .white)
                                .frame(height: 44)
                                .padding(.horizontal, 88)
                                .background(Color("DarkPink"))
                                .cornerRadius(50)
                        }
                        
                        
                        .background(
                            NavigationLink(
                                destination: AddMood(),
                                isActive: $isLoggedIn,
                                label: { EmptyView() }
                            )
                            
                        )
                        HStack{
                            Text("New Around Here?")
                            NavigationLink(destination: AddReport()) {
                                Text("SIGN UP")
                                    .font(.headline)
                                    .foregroundColor(Color("DarkPink"))
                            }

                        }
                        HStack(spacing: 15){
                            Rectangle()
                                .fill(Color("DarkPink"))
                            
                                .frame(height: 1)
                            
                            Text("OR")
                            
                            Rectangle()
                                .fill(Color("DarkPink"))
                                .frame(height: 1)
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google").foregroundColor(Color.black))
                            .padding(.vertical)
                            .onTapGesture {
                                viewModel.attemptLoginGoogle()
                                
                            }
                  
                    }
                    
                }
            }
        }
    }
    
   
    
    struct login_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                    }
                }
        }
        
        struct PrimaryButton: View {
            var title: String
            var body: some View {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor( .white)
                    .frame(height: 44)
                    .padding(.horizontal, 88)
                    .background(Color("DarkPink"))
                    .cornerRadius(50)
            }
        }
        
        
    }
    
    struct SocalLoginButton: View {
        var image: Image
        var text: Text
        
        var body: some View {
            HStack {
                image
                    .padding(.horizontal)
                
                Spacer()
                text
                    .font(.title2)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(50.0)
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
        }
    }}
