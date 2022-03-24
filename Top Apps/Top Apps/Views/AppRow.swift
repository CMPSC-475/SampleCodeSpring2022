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
            if let data = appInfo.imageData {
                let uiImage = UIImage(data: data)!
                Image(uiImage: uiImage)
            }
//            else {
//                let _ = manager.appImageFor(index: manager.index(for: appInfo)!)
//                ProgressView()
//            }
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
