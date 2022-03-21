//
//  AppDetails.swift
//  Top Apps
//

import SwiftUI

struct AppDetails: View {
    var appInfo : AppInfo
    var body: some View {
        ScrollView {
        Text(appInfo.summary)
        }
            .padding()
            .navigationTitle(appInfo.title)
    }
}

struct AppDetails_Previews: PreviewProvider {
    static var previews: some View {
        AppDetails(appInfo: AppInfo.standard)
    }
}
