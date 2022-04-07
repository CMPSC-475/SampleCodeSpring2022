//
//  AddView.swift
//  Do It Now
//
//  Created by Nader Alfares on 4/7/22.
//
import SwiftUI

struct AddView: View {
    @EnvironmentObject var manager : TaskManager
    @Environment(\.dismiss) var dismiss
    @State var text : String = ""
    @State var showAlert = false
    
    var body: some View {
        TextField("Enter New Item", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
 
    }
    

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
