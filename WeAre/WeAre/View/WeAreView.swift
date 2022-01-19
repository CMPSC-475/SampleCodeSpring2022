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
                LionView(imageName: cheerManager.cheerModel.mascotImageName)
                Spacer()
                CheeringView()
                CheerButton(cheerButtonText: "Cheer"){
                    cheerManager.doCheer()
                }
                Spacer()
            }
        }
    }
    
    let background : some View = Color.orange.ignoresSafeArea()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
            .environmentObject(CheerManager())
    }
}
