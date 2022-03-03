//
//  CardFlip.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/3/22.
//

import SwiftUI


struct CardFlip: View {
    enum DraggingState {
        case right, left
    }
    
    @State private var degrees  : Double = 0.0  // rotation angle
    @State private var swiping  = DraggingState.left //swipe direction
    
    var frontImageName = "psu"
    var bgColorFront = Color.blue
    var backImageName = "Swift"
    var bgColorBack = Color.gray
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0

    var body: some View {
        
        FlipImage(name: frontImageName, color: bgColorFront)
        .rotation3DEffect(Angle(degrees:degrees), axis: (0,1,0))

    }
    


  // Rotation should be between 0 and -180
    func rotationDegreesFor(_ translation: Double) -> Double {
        if translation > frontDegrees {
            return  frontDegrees
        } else if translation < backDegrees {
            return  backDegrees
        } else {
            return translation
        }
    }
    
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
