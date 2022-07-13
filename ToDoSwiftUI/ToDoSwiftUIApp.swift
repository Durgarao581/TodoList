//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by Ganga Durgarao Kothapalli on 13/07/22.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
        
    }
}
