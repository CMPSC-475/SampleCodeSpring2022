//
//  ContentView.swift
//  GestureExamples
//
//  Created by Nader Alfares on 2/28/22.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: TutorialView(), label: {
                    Label("Tutorial", systemImage: "list.dash")
                })
                
                NavigationLink(destination: MovingBoxView(), label: {
                    Label("Moving Box", systemImage: "square.stack")
                })
                
                NavigationLink(destination: Position(), label: {
                    Label("Position Example", systemImage: "dial.min.fill")
                })
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
