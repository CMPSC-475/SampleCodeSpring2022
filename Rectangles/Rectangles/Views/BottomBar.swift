//
//  BottomBar.swift
//  Rectangles
//
//  Created by Nader Alfares on 3/14/22.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {/*TODO: Action*/})
                {
                    Image(systemName:"trash.fill")
                }
                Spacer()
            }
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
