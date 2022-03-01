//
//  TutorialView.swift
//  GestureExamples
//
//  Created by Nader Alfares on 2/28/22.
//

import SwiftUI

struct TutorialView: View {
    @State var tapCount = 0
    @State var doubleTapCount = 0
    @State var longPressCount = 0
    @State var rotationAngle : Angle = Angle.zero
    @State var scaleFactor   : CGFloat = 1.0
    @State var dragOffset : CGSize = CGSize.zero
    
    var body: some View {
        VStack(spacing: 30){
            Text("Single Tap: \(tapCount)")

            Text("Double Tap: \(doubleTapCount)")

            Text("Long Press: \(longPressCount)")

            LogoView()
            
        }
    }
}


struct LogoView : View {
    var body : some View {
        Image("psu")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100)
    }
}

struct ColorSquare : View {
    var color : Color
    var body : some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: 100, height: 100)

    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
