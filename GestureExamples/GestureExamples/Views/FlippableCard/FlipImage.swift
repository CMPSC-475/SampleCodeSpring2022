//
//  FlipImage.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/3/22.
//
import SwiftUI

struct FlipImage  : View {
    var name : String
    var color : Color = .white
    var body: some View {
        Image(name)

            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .padding(100)
            .background(color)

    }
}

struct FlipImage_Previews: PreviewProvider {
    static var previews: some View {
        FlipImage(name: "psu")
    }
}
