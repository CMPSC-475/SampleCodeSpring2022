//
//  PictureAlbumView.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 2/22/22.
//

import SwiftUI

struct PictureAlbumView: View {
    var imageNames : [String] = []
    var body: some View {
        NavigationView {
            TabView {
                ForEach(imageNames, id:\.self){name in
                    Image(name)
                        .resizable()
                        .scaledToFit()
//                        .resizable()
//                        .frame(width: 200)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .background(Color.gray)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Text("Button")
                }
            }
        }
    }
}

//struct PictureAlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureAlbumView()
//    }
//}
