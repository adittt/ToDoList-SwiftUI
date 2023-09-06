//
//  ToDoListDetailItem.swift
//  ToDoList
//
//  Created by Adit Salim on 02/09/23.
//

import Foundation

struct ToDoListDetailItem: Codable, Identifiable {
        let id: String
        let title: String
        let dueDate: TimeInterval
        let createdDate: TimeInterval
        var isDone: Bool
    
        mutating func setDone(_ state: Bool) {
            isDone = state
        }
    
}
