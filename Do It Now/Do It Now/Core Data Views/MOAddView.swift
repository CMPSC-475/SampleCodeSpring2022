//
//  MOAddView.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOAddView: View {
    //@EnvironmentObject var manager : TaskManager
    @Environment(\.managedObjectContext) private var viewContext

    @Binding var isAdding : Bool
    @Environment(\.dismiss) var dismiss
    @State var text : String = ""
    @State var showAlert = false
    @State var alertMessage : String = ""
    
    var body: some View {
        TextField("Enter New Item", text: $text)
            .onSubmit {
                if isValid(text: text) {
                    let item = ItemMO(context:viewContext)
                    item.title = text
                    item.date = Date()
                    item.done = false
                    do {
                        try viewContext.save()
                    } catch {
                        alertMessage = "Error saving added item"
                        showAlert = true
                    }
                     
                    dismiss()
                    isAdding = false
                } else {
                    alertMessage = "Item cannot be empty"
                    showAlert = true
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(20)
           
            .alert(alertMessage, isPresented: $showAlert, actions: {})
    }
    
    func isValid(text:String) -> Bool {
        !text.isEmpty
    }

}

//struct MOAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOAddView()
//    }
//}
