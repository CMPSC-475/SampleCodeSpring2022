//
//  CheeringView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct CheeringView: View {
    var cheerText : String
    var body: some View {
        Text(cheerText)
            .font(.title)
            .bold()
    }
}

struct CheeringView_Previews: PreviewProvider {
    static var previews: some View {
        CheeringView(cheerText: "We are")
    }
}
