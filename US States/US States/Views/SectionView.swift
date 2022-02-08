//
//  SectionView.swift
//  US States
//
//  Created by Nader Alfares on 2/7/22.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var manager : StateManager
    let indices : [Int]
    
    var body: some View {
        ForEach(indices, id: \.self) { index in
            NavigationLink(destination: DetailView(state: $manager.stateModel.states[index])) {
                StateRow(state: manager.stateModel.states[index])
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            SectionView(indices: [0,1,2,3])
                .environmentObject(StateManager())
        }
    }
}
