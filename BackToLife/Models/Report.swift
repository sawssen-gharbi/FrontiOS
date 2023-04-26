//
//  Report.swift
//  BackToLife
//
//  Created by Mac Mini 2 on 28/3/2023.
//

import Foundation

class Report: ObservableObject{
    @Published var date: String?
    @Published var mood: String?
    @Published var depressedMood: String?
    @Published var elevatedMood: String?
    @Published var irritabilityMood: String?
    @Published var symptoms: String?
    @Published var user : String?
  

}
