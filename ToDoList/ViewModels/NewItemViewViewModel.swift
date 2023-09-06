//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Adit Salim on 06/08/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var color = Color.black
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            color: color.toHex() ?? "#000"
        )
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

//        guard !color.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return false
//        }
        
        return true
    }
}
