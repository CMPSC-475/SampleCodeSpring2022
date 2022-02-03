//
//  GuessButtonView.swift
//  Memory
//
//  Created by jjh9 on 9/1/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct GuessButtonView : View {
    @EnvironmentObject var memoryViewModel : MemoryManager
    let index : Int  //specifies which button
    let labelFontSize : CGFloat = 100
    
    var body: some View {
        let gamePiece = GamePiece(background: .red, title: "A")
        //TODO: get game piece from view model
        
        //TODO: fill out the action of the button
        return Button(action: {/* action */}) {
            GamePieceView(gamePiece: gamePiece, fontSize: labelFontSize)
                
        }
        //TODO: disable guess button when needed
    }
    

}

struct ColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GuessButtonView(index: 0)
            .environmentObject(MemoryManager())
    }
}


