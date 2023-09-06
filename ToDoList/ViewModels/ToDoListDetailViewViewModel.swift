//
//  ToDoListDetailViewViewModel.swift
//  ToDoList
//
//  Created by Adit Salim on 02/09/23.
//

import Foundation
import FirebaseFirestore

class ToDoListDetailViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    private let itemId: String
    
    init(userId: String, itemId: String) {
        self.userId = userId
        self.itemId = itemId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
