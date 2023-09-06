//
//  ToDoListDetail.swift
//  ToDoList
//
//  Created by Adit Salim on 28/08/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListDetail: View {
    @StateObject var viewModel: ToDoListDetailViewViewModel
    @FirestoreQuery var items: [ToDoListDetailItem]
    
    init(userId: String, itemId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos/\(itemId)/details")
        self._viewModel = StateObject(
            wrappedValue: ToDoListDetailViewViewModel(userId: userId, itemId: itemId)
        )
    }
    
    var body: some View {
        VStack {
            List(items) { item in
                HStack {
                    Text(item.title)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    }

                }
            }
        }
    }
}

struct ToDoListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListDetail(userId: "rgbIACZmVkYmPjQm6U2IEfUc68U2", itemId: "aOHZoGNFnsU1bF7zdZtz")
//        ToDoListDetail()
    }
}
