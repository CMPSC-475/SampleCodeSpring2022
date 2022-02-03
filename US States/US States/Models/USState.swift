//
//  USState.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

struct USState : Codable, Identifiable {
    let name : String
    let capital : String
    let info : String
    let year : Int
    let images : [String]
    var id : String {name}
    var visited : Bool
    
    static let standard = USState(name: "Pennsylvania", capital: "Harrisburg", info: "Welcome to Pennsylvania", year: 1787, images: ["PA01","PA02"], visited: false)
}
