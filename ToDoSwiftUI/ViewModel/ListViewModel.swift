//
//  ListViewModel.swift
//  ToDoSwiftUI
//
//  Created by Ganga Durgarao Kothapalli on 13/07/22.
//

import Foundation

class ListViewModel:ObservableObject{
    @Published var items: [ItemModel] = []
    
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [ItemModel(title: "This is first", isCompleted: true),
                        ItemModel(title: "Second", isCompleted: false),
                        ItemModel(title: "Third", isCompleted: false)
                       ]
        
        items.append(contentsOf: newItems)
    }
    func deleteItem(index:IndexSet){
        items.remove(atOffsets: index)
        
    }
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
        
    }
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
}
