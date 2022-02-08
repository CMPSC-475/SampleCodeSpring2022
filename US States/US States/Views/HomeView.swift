//
//  HomeView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var stateManager : StateManager
    @State var showPreferences : Bool = false
    var body: some View {
        NavigationView {
            List {
                //TODO: Add Home state infor if selected
                NavigationLink(destination: StateListView(showPreferences: $showPreferences)) {
                    Text("All States")
                }
            }
            .sheet(isPresented: $showPreferences) {
                PreferenceView(showingPreferences: $showPreferences)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {showPreferences.toggle()}, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreferences: true)
    }
}
