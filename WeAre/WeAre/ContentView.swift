//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    var imageName : String = "Mascot"
    var cheerText : String = "We Are"
    var body: some View {
        ZStack{
            Color.orange
            VStack{
                Spacer()
                LionView(imageName: imageName)
                Spacer()
                CheeringView(cheerText: cheerText)
                CheerButton(cheerButtonText: "Cheer")
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(imageName: "Mascot", cheerText: "We Are")
    }
}
