//
//  StateListView.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import SwiftUI

struct StateListView: View {
    @EnvironmentObject var manager : StateManager
    
    var body: some View {
        NavigationView{
            List{
                ForEach($manager.stateModel.states) { $state in
                    NavigationLink(destination: DetailView(state: $state), label: {
                        StateRow(state: $state)
                    })

                }
            }
            .navigationTitle("US States")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {/* TODO: add an action */}, label: {
                        Image(systemName: "highlighter")
                    })
                }
            }
        }
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
            .environmentObject(StateManager())
    }
}
