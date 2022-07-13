//
//  ListRowView.swift
//  ToDoSwiftUI
//
//  Created by Ganga Durgarao Kothapalli on 13/07/22.
//

import SwiftUI

struct ListRowView: View {
    let title:ItemModel
    var body: some View {
        HStack{
            Image(systemName: title.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(title.isCompleted ? Color.green : Color.red)
            Text(title.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static let  item = ItemModel(title: "This is first", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(title: item)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
