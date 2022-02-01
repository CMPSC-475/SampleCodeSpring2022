//
//  StorageManager.swift
//  US States
//
//  Created by Nader Alfares on 2/1/22.
//

import Foundation

class StorageManager {
    var states : [USState]
    let filename = "StateData"
    
    init(){
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")!
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            states = try decoder.decode([USState].self, from: data)
        } catch {
            states = []
        }
        
    }
    
}