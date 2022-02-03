//
//  StateRow.swift
//  US States
//
//  Created by Nader Alfares on 2/2/22.
//

import SwiftUI

struct StateRow: View {
    @Binding var state : USState
    var body: some View {
        HStack{
            NavigationLink(destination: DetailView(state: $state), label: {
                Text(state.name)
            })
            Spacer()
            Image(systemName: state.visited ? "star.fill" : "star")
        }
    }
}

struct StateRow_Previews: PreviewProvider {
    static var previews: some View {
        @State var standaradState = USState.standard
        return StateRow(state: $standaradState)
    }
}
