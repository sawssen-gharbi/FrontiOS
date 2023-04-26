//
//  ReportService.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 14/4/2023.
//

import Foundation
import UIKit
import SwiftUI

fileprivate struct MoodResponse: Codable {
    var newReport: NewReport?
    var message: String?
    var statusCode: Int?
    var verifReport : NewReport?
 

    init(newReport: NewReport?, message: String?, statusCode: Int?) {
        self.newReport = newReport
        self.message = message
        self.statusCode = statusCode
  
    }
}

struct NewReport: Codable {
    var date: String
    var mood: String
    var _id: String
}

fileprivate struct MoodBodyParams: Codable {
    var mood: String
    var date: String
    var user: String
 

    
    init(mood: String, date: String, user: String) {
        self.mood = mood
        self.date = date
        self.user = user
     
    }
}

class MoodService {
    
    var validate = false
    
    public func _addmood(_ mood: String, _ date: String, _ user: String ) async throws -> NewReport? {
        let apiEndpoint = URL(string: "http://localhost:7001/report/addMood")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        let bodyParams = MoodBodyParams(mood: mood , date: date, user: user)
        
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)
  
        

        
        
        let mood = try JSONDecoder().decode(MoodResponse.self, from: responseData)
        
        print("Response Mood" , mood)
      
        if mood.statusCode == 200 {
            // Display an alert to the user informing them that the mood was added successfully
            DispatchQueue.main.async {
                self.showAlert(title: "Info", message: "Mood added successfully!")
               }
        }
       
            if let message = mood.message, message == "Report already exists !" {
                DispatchQueue.main.async {
                    self.showAlert(title: "Warning", message: "You already entered your mood for today.")
                   }

            }
            
        return mood.newReport

            
        }
  
        
 

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
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
