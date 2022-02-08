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
    func sectionInfo(for sectioning:Sectioning) -> [SectionInfo] {
        switch sectioning {
        case .byName:
            let titles = sectionTitles(for: {s in s.name.firstLetter!})
            let info = titles.map { t in
                SectionInfo(title: t, indicies: indices(for: { s in
                    s.name.firstLetter! == t}))
            }
            return info
        case .byDecade:
            let titles = sectionTitles(for: {s in s.decadeFounded})
            let info = titles.map { t in
                SectionInfo(title: t, indicies: indices(for: { s in
                    s.decadeFounded == t}))
            }
            return info
        default:
            break
        }
        
        return []
    }


    func sectionTitles(for property : (USState) -> String) -> [String] {
        let titles = Set(stateModel.states.map(property))
        return titles.sorted()
    }

    func indices(for property : (USState) -> Bool) -> [Int] {
        let filteredState = stateModel.states.filter(property)
        let indices = filteredState.map { s in
            stateModel.states.firstIndex(where: { _s in _s.name == s.name})!
        }
        return indices.sorted()
    }
}
