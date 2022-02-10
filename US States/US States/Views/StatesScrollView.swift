//
//  StatesScrollView.swift
//  US States
//
//  Created by Nader Alfares on 2/9/22.
//

import SwiftUI

struct StatesScrollView: View {
    var states : [USState]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(states) { s in
                    Image(s.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

//struct StatesScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatesScrollView()
//    }
//}
