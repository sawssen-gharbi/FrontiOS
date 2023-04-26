//
//  BackToLifeApp.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 20/3/2023.
//

import SwiftUI
import UIKit

@main
struct BackToLifeApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistenceController = PersistenceController.shared
    @StateObject private var userData = UserData()
    @StateObject private var report = Report()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                .environmentObject(report)
                
                       
                    }
                }
        }
    

