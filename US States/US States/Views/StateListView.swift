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
                    StateRow(state: $state)
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
