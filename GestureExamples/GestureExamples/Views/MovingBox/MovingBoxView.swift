//
//  MovingBoxView.swift
//  GestureExamples
//
//  Created by Nader Alfares on 2/28/22.
//
import SwiftUI

struct ScreenSize {
    static let width  = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

struct MovingBoxView: View {
    @State var location : CGPoint = CGPoint(x: ScreenSize.width/2, y: ScreenSize.height/2)
    var body: some View {
        ColorSquare(color: .orange)
            .draggable(location: $location)
    }
}

struct MovingBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MovingBoxView()
    }
}
