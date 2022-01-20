//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 1/20/22.
//

import Foundation


class CheerManager : ObservableObject {
    @Published var cheerModel : CheerModel = CheerModel()
    
    init(){
        cheerModel = CheerModel()
    }
    
    private enum State {
        case ready, weare, pennstate
    }
    
    private var cheerState : State {
        
        if cheerModel.cheerCount == 0 {
            return .ready
        } else if cheerModel.cheerCount % 2 == 1 {
            return .weare
        } else {
            return .pennstate
        }
    }
    var cheer1Visible : Bool {cheerState == .weare}
    var cheer2Visible : Bool {cheerState == .pennstate}
    private var totalCheers : Int { 1 + (CheerModel.firstRoundCount + CheerModel.secondRoundCount) * 2}
    private var currentRound : Int {(cheerModel.cheerCount+1)/2}
    private var isWeAreRound : Bool {currentRound <= CheerModel.firstRoundCount}
    
    func doCheer(){
        var topCheerText : String {isWeAreRound ? CheerModel.firstRoundCheers.0 : CheerModel.secondRoundCheers.0}
        var bottomCheerText : String {isWeAreRound ? CheerModel.firstRoundCheers.1 : CheerModel.secondRoundCheers.1}
        var mascotImageName : String {
            switch cheerState {
            case .ready:
                return CheerModel.mascotImageNames.0
            case .weare:
                return CheerModel.mascotImageNames.1
            case .pennstate:
                return CheerModel.mascotImageNames.2
            }
        }
        
        
        cheerModel.incrementCheerCount(modulo: totalCheers)
        cheerModel.changeCheers(to: topCheerText, and: bottomCheerText)
        cheerModel.changeMascotName(to: mascotImageName)
    }
    
    
    

    

    
    
}
