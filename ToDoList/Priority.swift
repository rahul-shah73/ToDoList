//
//  Priority.swift
//  ToDoList
//
//  Created by Rahul Shah on 24/05/25.
//

import Foundation
import SwiftUI

enum Priority: String, CaseIterable, Identifiable {
    
    var id: Self {self}
    case high
    case medium
    case low
    
  
    
    var title: String{
        switch self{
        case .high:
            return "high"
            
        case .medium:
            return "medium"
            
        case  .low:
            return "low"
        }
    }
    
    var color: Color{
        switch self {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
        }
    }
}
