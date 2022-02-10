//
//  CustomHeader.swift
//  US States
//
//  Created by Nader Alfares on 2/8/22.
//

import SwiftUI

struct CustomHeader: View {
    let text : String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 25))
        }
    }
}

struct CustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeader(text: "All States")
    }
}
