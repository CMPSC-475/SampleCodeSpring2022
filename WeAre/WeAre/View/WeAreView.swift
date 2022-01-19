//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct WeAreView: View {
    @EnvironmentObject var cheerManager : CheerManager
    var body: some View {
        ZStack{
            background
            VStack{
                Spacer()
                LionView(imageName: imageName)
                Spacer()
                CheeringTextView(cheerText: cheerText1)
                CheeringTextView(cheerText: cheerText2)
                CheerButton(cheerButtonText: "Cheer"){}
                Spacer()
            }
        }
    }
    
    let background : some View = Color.orange.ignoresSafeArea()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(imageName: "Mascot")
    }
}
