//
//  User.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 12/4/2023.
//

import Foundation

class UserData: ObservableObject{
    @Published var id: Int?
    @Published var email: String?
    @Published var password: String?
    @Published var token: String? 


}

