//
//  CheeringView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct CheeringTextView : View {
    var cheerText : String
    var body : some View {
        Text(cheerText)
            .font(.system(size: ViewConstants.cheerFontSize))
            .bold()
            .padding()
            .foregroundColor(Color.blue)
            .background(Capsule()
                                        
                                        .strokeBorder(Color.blue, lineWidth: 5)
                                        .background(Capsule().fill(Color.white)))
    }
}


struct CheeringView_Previews: PreviewProvider {
    static var previews: some View {
        CheeringTextView(cheerText: "We Are")
    }
}
