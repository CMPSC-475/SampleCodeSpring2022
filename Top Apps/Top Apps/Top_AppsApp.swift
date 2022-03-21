//
//  Top_AppsApp.swift
//  Top Apps
//

import SwiftUI

@main
struct Top_AppsApp: App {
    @StateObject var manager = TopAppManager()
    var body: some Scene {
        WindowGroup {
            TopAppsList()
                .environmentObject(manager)
        }
    }
}
