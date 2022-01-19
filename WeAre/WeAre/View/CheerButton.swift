//
//  CheerButton.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct CheerButton: View {
    var cheerButtonText : String
    var action : () -> Void
    var body: some View {
        
        Button(action: action){
            Text(cheerButtonText)
                .bold()
                .font(.system(size: ViewConstants.buttonFontSize))
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
        CheerButton(cheerButtonText: "Cheer"){}
    }
}
