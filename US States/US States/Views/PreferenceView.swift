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
    //TODO: sectioning
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @AppStorage(Storage.homeStateIndex) var homeStateIndex : Int?
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Home State")) {
                    Picker("Choose State", selection: $homeStateIndex) {
                        Text("None").tag(nil as Int?)
                        ForEach(manager.stateModel.states.indices, id:\.self) {index in
                            Text(manager.stateModel.states[index].name).tag(index as Int?)
                        }
                    }
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
