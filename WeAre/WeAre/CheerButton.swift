//
//  CheerButton.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct CheerButton: View {
    var cheerButtonText : String
    var body: some View {
        Button(action: {}){
            Text(cheerButtonText)
                .bold()
                .font(Font.system(size: 25))
                .padding()
                .background(Capsule()
                                .strokeBorder(Color.blue, lineWidth: 50)
                                .background(Capsule().fill(Color.blue)))
                .foregroundColor(.white)
                
                
        }
    }
}

struct CheerButton_Previews: PreviewProvider {
    static var previews: some View {
        CheerButton(cheerButtonText: "Cheer")
    }
}
