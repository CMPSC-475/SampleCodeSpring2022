//
//  DetailView.swift
//  US States
//
//  Created by jjh9 on 9/11/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var manager: StateManager
    @Binding var state : USState
    var body: some View {
            List {
            //TODO: add year founded, description, images, favorite button
                Text(state.name)
            }

    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {
        @State var stateStandard = USState.standard
        return DetailView(state: $stateStandard)
            .environmentObject(StateManager())
    }
}

