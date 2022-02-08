//
//  StateManager.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

class StateManager : ObservableObject {
    @Published var stateModel = StateModel()
    
    //MARK - Computed Properties -
    // get the indicies for all states in the model
    var allIndicies : [Int] {Array(stateModel.states.indices)}
    
    func formatFor(year:Int) -> String {
        String(format: "%04d", year)
    }

    //TODO: Implement sectioning logic
    /*
    func sectionInfo(for sectioning:Sectioning) -> [SectionInfo] {
        return []
    }
     */
    
    /*
    func sectionTitles(for property : (USState) -> String) -> [String] {
    }
 
     */
    
    /*
    func indices(for property : (USState) -> Bool) -> [Int] {
    }
     */
}
