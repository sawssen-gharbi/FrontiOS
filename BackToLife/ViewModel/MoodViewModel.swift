//
//  MoodViewModel.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 24/4/2023.
//

import Foundation
extension AddMood {
    @MainActor class ViewModel1: NSObject, ObservableObject {
      
        @Published var date: String = ""
        @Published var mood: String = ""
        //user id from userdefault
        let userId = UserDefaults.standard.string(forKey: "userId")
        @Published var authSuccessful: Bool = true
        @Published var errorMessage: String = ""
        @Published var isLoading: Bool = false
        
        
        //google
        @Published var isMoodSuccessed = false
        

        // login
        func attemptMood(report: Report) async {
            isLoading = true
            self.isMoodSuccessed = true
            defer {
                isLoading = false
            }
            do {
                let moodRes = try await MoodService()._addmood(mood, date, userId!)
                
            } catch let error {
                if type(of: error) == MoodService.self.AuthenticationError.self {
                    errorMessage = error.localizedDescription
                } else {
                    print("Application error: ", error)
                    errorMessage = "Connection error"
                }
                authSuccessful = false
            }
        }
        
       
        
        
    
    }
}
