//
//  ListViewModel.swift
//  ToDoSwiftUI
//
//  Created by Ganga Durgarao Kothapalli on 13/07/22.
//

import Foundation

class ListViewModel:ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemKey:String = "list_items"
    
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
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
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items.self){
            UserDefaults.standard.set(encodedData,forKey: itemKey)
        }
    }
}
