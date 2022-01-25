//
//  ContentView.swift
//  Memory
//
//  Created by jjh9 on 8/30/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI
import Combine

struct MemoryView: View {
    @EnvironmentObject var memoryManager : MemoryManager
    @State private var showPreferences = false
    var body: some View {
        
        ZStack {
            //TODO: add a background that can change in color
            VStack {
                HStack {
                    GuessButtonView( index:0)
                    GuessButtonView(index:1)
                }
                HStack {
                    GuessButtonView(index:2)
                    GuessButtonView(index:3)
                }
                Spacer(minLength: 50)
                SequenceView()
                MainButtonView()
                
                //TODO: add the preference button view
                
                
            }
            .padding()
            .environmentObject(memoryManager)
            //TODO: show sheet when going to prefrence
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView()
            .environmentObject(MemoryManager())
    }
}


