//
//  ItemModel.swift
//  Taskaroo
//
//  Created by Batuhan Akdemir on 11.01.2024.
//


import Foundation
import SwiftData

@Model
class ItemModel {
    
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
           self.id = id
           self.title = title
           self.isCompleted = isCompleted
       }
       
}

