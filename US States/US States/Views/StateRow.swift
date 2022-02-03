//
//  StateRow.swift
//  US States
//
//  Created by Nader Alfares on 2/2/22.
//

import SwiftUI

struct StateRow: View {
    @Binding var state : USState
    let height : CGFloat = 60.0
    var body: some View {
        HStack{
            Text(state.name)
            Spacer()
            Image(state.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
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
