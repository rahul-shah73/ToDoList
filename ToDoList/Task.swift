//
//  Task.swift
//  ToDoList
//
//  Created by Rahul Shah on 25/05/25.
//

import Foundation
struct Task: Identifiable, Hashable{
    let id = UUID()
    let title : String
    let priority : String
    let iscompleted : Bool
}
