//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

struct WeAreView: View {
    var imageName : String = "Mascot"
    var body: some View {
        ZStack{
            background
            VStack{
                Spacer()
                LionView(imageName: "Mascot")
                Spacer()
                CheeringView()
                Spacer()
                CheerButton(cheerButtonText: "Cheer"){}
                Spacer()
            }
        }
    }
    
    let background : some View = Color.orange.ignoresSafeArea()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
    }
}
