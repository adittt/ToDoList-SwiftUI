//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Adit Salim on 06/08/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack (alignment: .center) {
            Circle()
                .strokeBorder(Color(hex: item.color) ?? .black, lineWidth: 8)
                .frame(width: 35, height: 35)
                .padding(.trailing, 10)
            
            Text(item.title)
                .font(.body)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))

        }
        .padding()
        .background(Rectangle().fill(.background))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 0, y: 0)
        .overlay {
            NavigationLink {
                ToDoListDetail(userId: "rgbIACZmVkYmPjQm6U2IEfUc68U2", itemId: item.id)
//                ToDoListDetail()
            } label: {
                EmptyView()
            }
            .opacity(0)

        }
        
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "asc",
            title: "Beli Aja",
            color: "#FFF")
        )
    }
}
