//
//  ContentView.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
            NavigationLink("Artboard") {
                ArtboardView()
            }
            NavigationLink("Practice") {
                PracticeView()
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
