//
//  TabView.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 2/22/22.
//

import SwiftUI


struct ImageNames {
    static let Lion = ["Lion1", "Lion2"]
    static let Pitt = ["PITT1", "PITT2"]
    static let SC   = ["SC1", "SC2"]
}

struct TabViewExample: View {
    var body: some View {
        TabView {
            PictureAlbumView(imageNames: ImageNames.Lion)
                .tabItem { Label("Lion", systemImage: "l.circle.fill") }
            PictureAlbumView(imageNames: ImageNames.Pitt)
                .tabItem { Label("Pittsburgh", systemImage: "p.circle.fill") }
            PictureAlbumView(imageNames: ImageNames.SC)
                .tabItem { Label("State College", systemImage: "s.circle.fill") }
        }
    }
}




struct TabViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabViewExample()
    }
}
