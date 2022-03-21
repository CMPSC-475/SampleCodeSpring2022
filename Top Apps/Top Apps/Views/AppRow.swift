//
//  AppRow.swift
//  Top Apps
//

import SwiftUI

struct AppRow: View {
    @EnvironmentObject var manager : TopAppManager
    var appInfo : AppInfo
    var body : some View {
        HStack {
            //TODO: Image goes here
            VStack {
                Text(appInfo.title)
                Text(appInfo.author)
            }
        }
    }
}

struct AppRow_Previews: PreviewProvider {
    static var previews: some View {
        AppRow(appInfo: AppInfo.standard)
    }
}
