//
//  US_StatesApp.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @StateObject var stateManager = StateManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(stateManager)
        }
        .onChange(of: scenePhase) { phase in
            switch phase{
            case .background, .inactive:
                stateManager.stateModel.save()
                break
            default:
                break
            }
        }
    }
}
