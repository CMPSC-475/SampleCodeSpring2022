//
//  CheeringConstants.swift
//  WeAre
//
//  Created by Nader Alfares on 1/19/22.
//

import Foundation


struct CheerModel{
    static let mascotImageNames = ("Mascot", "Mascot1", "Mascot1Reversed")
    static let firstRoundCheers = ("We Are", "Penn State")
    static let secondRoundCheers = ("Thank You", "You're Welcome")
    
    static let firstRoundCount = 3
    static let secondRoundCount = 1
    
    var mascotImageName : String
    var cheer1 : String
    var cheer2 : String
    var cheerCount = 0
    
    init(){
        mascotImageName = CheerModel.mascotImageNames.0
        cheer1 = CheerModel.firstRoundCheers.0
        cheer2 = CheerModel.secondRoundCheers.0
    }
    
    mutating func changeMascotName(to name: String) {
        mascotImageName = name
    }
    
    mutating func incrementCheerCount(modulo modulus: Int){
        cheerCount = (cheerCount + 1) % modulus
    }
    
    mutating func changeCheers(to first: String, and second: String){
        cheer1 = first
        cheer2 = second
    }
    
    
}



