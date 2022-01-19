//
//  WeAreApp.swift
//  WeAre
//
//  Created by Nader Alfares on 1/13/22.
//

import SwiftUI

@main
struct WeAreApp: App {
    var body: some Scene {
        WindowGroup {
            WeAreView()
                .environmentObject(CheerManager())
        }
    }
}
