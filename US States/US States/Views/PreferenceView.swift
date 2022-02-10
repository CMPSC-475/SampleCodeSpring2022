//
//  PreferenceView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/19/21.
//

import SwiftUI

struct PreferenceView: View {
    @EnvironmentObject var manager : StateManager
    @Binding var showingPreferences : Bool
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Home State")) {
                    //TODO: Picker for selecting home state
                    Text("TODO")
                }
                
                Section(header: Text("List Sections")) {
                    Picker("Choose Sectioning", selection: $sectioning) {
                        ForEach(Sectioning.allCases, id:\.self) {section in
                            Text(section.rawValue)
                        }
                    }
                }

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {self.showingPreferences.toggle()}
                }
            }
  
        }
        .navigationBarTitle("Preferences")
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView( showingPreferences: .constant(true))
            .environmentObject(StateManager())
    }
}
