//
//  loginview.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 24/3/2023.
//

import SwiftUI

import SwiftUI

struct loginview: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Grey").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Sign In")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                    
                    Image(uiImage: #imageLiteral(resourceName: "hey"))
                        .resizable()
                        .frame(width: 400 , height: 300)
                
                    
                    Spacer()
                    
                    TextField("Your email address", text: $email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50.0)
                    
                
                    
                    TextField("Your password", text: $password)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50.0)
                        .padding(.bottom,20)
                   
                    
                    
                        PrimaryButton(title: "Login")
                        
                    HStack{
                        Text("New Around Here?")
                        Text("SIGN UP")
                            .foregroundColor(Color("DarkPink"))
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
                    .padding(.top, 50)
                    
                    SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "google")), text: Text("Sign in with Google").foregroundColor(Color.black))
                                          .padding(.vertical)
                    
                }
              
            }
        }
    }
}
                    
                    
                    struct loginview_Previews: PreviewProvider {
                        static var previews: some View {
                            login()
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
}
