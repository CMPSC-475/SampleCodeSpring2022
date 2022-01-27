//
//  MemoryManager.swift
//  Memory
//
//  Created by jjh9 on 9/6/21.
//

import Foundation
import SwiftUI

class MemoryManager :ObservableObject {
    @Published var memoryModel = MemoryModel()
    
    //MARK: - Computed Properties -
    //TODO: Compute values for these variables
    var shouldDisableGuessButton : Bool {true} //TODO
    var shouldDisablePlayButton : Bool {true}  //TODO
    var shouldDisplayMemorizeText : Bool {true}//TODO
    

    private var currentGuessIndex : Int {memoryModel.currentGuessIndex-1}
    
    var background : Color {
        //TODO: Determine what the background color should be given the state
        return Color.darkYellow
    }
    
    var mainButtonTitle : String {
        //TODO: Determine what text to show in the control button
        return "??"
    }
    

    
    var gameSequence : [GamePiece] {
        //TODO: how do the peices should be represented in the game?
        return [GamePiece(background: Color.blue, title: " ")]
    }
    private var currentTheme : Theme {
        //TODO: what is the current theme that the user selected
        return Themes.colors
    }
    
    
    //MARK: - View Customization -
    // What game piece to display for button with index i
    func gamePieceFor(index i: Int) -> GamePiece {
        //TODO: return peice of the selected theme
        Themes.colors[i]
    }
    
    // how many dots are shown?  All of them if we're showing the user the initial sequence or if all guessed correctly.  Otherwise only ones they've guessed correctly so far
    var visibleSequenceCount : Int  {
        //TODO: Complete this
        return memoryModel.sequence.count
    }
    
    //TODO: 
//    private var currentGuessIndex : Int {memoryModel.currentGuessIndex-1}
//    // scale factor for sequence pieces - enlarge current guess
//    func scaleForPieceAt(index i:Int) -> CGFloat {
//        //TODO: Complete this
//        1
//    }
    
    //MARK: - Intents -
    // Intent for control button
    func advanceGameState() {
        //TODO: Complete this
    }
    
    // Intent for game buttons
    func nextGuess(guess i:Int) {
        //TODO: check if guess i is correct
    }
}
