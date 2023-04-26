//
//  ContentView.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 20/3/2023.
//

import SwiftUI
import CoreData
import UIKit
import GoogleSignIn

struct ContentView: View {
    
    
    var body: some View {
        // storyboardview().edgesIgnoringSafeArea(.all)
        
        LoginView()
    }
  
   
    }
    
    

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
               
             
        }
        
        
        struct storyboardview: UIViewControllerRepresentable{
            
            func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
                
            }
            
            func makeUIViewController(context: Context) -> some UIViewController {
                let storyboard = UIStoryboard(name: "LoginGoogleView", bundle: Bundle.main)
                let controller = storyboard.instantiateViewController(withIdentifier: "LoginGoogleViewController")
                return controller
                
            }
            
            
        }
    }

