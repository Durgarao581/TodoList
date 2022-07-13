//
//  AddView.swift
//  ToDoSwiftUI
//
//  Created by Ganga Durgarao Kothapalli on 13/07/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText:String = ""
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing:16) {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                .background(Color.gray)
                .cornerRadius(12)
                Button (action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                })

            }
            .padding(18)
                
                
        }
        .navigationTitle("Add an Item 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textisAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            
        }
        
        
    }
    
    func textisAppropriate()->Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item less than 3 charecters long!!! 😱😨"
            showAlert.toggle()
            return false
            
        }
        return true
    }
    
    func getAlert()->Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
