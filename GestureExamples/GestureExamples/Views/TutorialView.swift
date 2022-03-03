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
        
        let tapGes = TapGesture()
            .onEnded{
                tapCount += 1
            }
        
        let doubleTap = TapGesture(count: 2)
            .onEnded { _ in
                doubleTapCount += 1
            }
        
        let longPress = LongPressGesture()
            .onEnded { value in
                longPressCount += 1
            }
        
        let magGest = MagnificationGesture()
            .onChanged { value in
                scaleFactor = value
            }
            .onEnded { _ in
                scaleFactor = 1.0
            }
        
        let dragGest = DragGesture()
            .onChanged { value in
                dragOffset = value.translation
            }
            .onEnded { value in
                dragOffset = CGSize.zero
            }
        
        let rotGest = RotationGesture()
            .onChanged { angle in
                rotationAngle = angle
            }
            .onEnded { _ in
                rotationAngle = Angle.zero
            }
        
        let magRot = magGest.simultaneously(with: rotGest)
        
        return VStack(spacing: 30){
            Text("Single Tap: \(tapCount)")
                .gesture(tapGes)

            Text("Double Tap: \(doubleTapCount)")
                .gesture(doubleTap)

            Text("Long Press: \(longPressCount)")
                .gesture(longPress)

            LogoView()
                .scaleEffect(scaleFactor)
                //.offset(dragOffset)
                .rotationEffect(rotationAngle)
                //.gesture(dragGest)
                //.gesture(magGest)
                //.gesture(rotGest)
                .gesture(magRot)


            
        }
    }
}


struct LogoView : View {
    var body : some View {
        Image("psu")
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.frame(width:100)
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
