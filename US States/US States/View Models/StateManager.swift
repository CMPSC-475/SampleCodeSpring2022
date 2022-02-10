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
    
    var visitedStates : [USState] {
        stateModel.states.filter({$0.visited})
    }
    
    var favoriteStates : [USState] {
        stateModel.states.filter({$0.favorite})
    }
    
    func formatFor(year:Int) -> String {
        String(format: "%04d", year)
    }

    // array of section titles given a function that takes a state and generates its titlle
    func sectionTitles(for sectionTitle : (USState) -> String) -> [String] {
        let titles = Set( stateModel.states.map(sectionTitle))
        return titles.sorted()
    }
    
    // indices for all states satisfying the given property
    func indices(for property : (USState) -> Bool) -> [Int] {
        let filteredStates =  stateModel.states.filter(property)
        
        let indices = filteredStates.map {s in
            stateModel.states.firstIndex(where: {$0.name == s.name})! }
        
        return indices.sorted()
    }
    
    func sectionInfo(for keyPath: KeyPath<USState,String>) -> [SectionInfo] {
        let titles = sectionTitles(for:{(s : USState) in s[keyPath:keyPath]})
        let info = titles.map {t in SectionInfo(title: t, indicies: indices(for: {(s : USState) in s[keyPath:keyPath] == t}))}
        return info
    }
    
    func sectionInfo(for sectioning:Sectioning) -> [SectionInfo] {
        switch sectioning {
        case .byName:
            return sectionInfo(for: \.name.firstLetter!)
            
        case .byDecade:
            return sectionInfo(for: \.decadeFounded)

        case .none:
            assert(false, "No section titles for .none option")
        }
    }
    
    
//    func sectionInfo(for sectioning:Sectioning) -> [SectionInfo] {
//        switch sectioning {
//        case .byName:
//            let titles = sectionTitles(for: {s in s.name.firstLetter!})
//            let info = titles.map { t in
//                SectionInfo(title: t, indicies: indices(for: { s in
//                    s.name.firstLetter! == t}))
//            }
//            return info
//        case .byDecade:
//            let titles = sectionTitles(for: {s in s.decadeFounded})
//            let info = titles.map { t in
//                SectionInfo(title: t, indicies: indices(for: { s in
//                    s.decadeFounded == t}))
//            }
//            return info
//        default:
//            break
//        }
//
//        return []
//    }
//
//
//    func sectionTitles(for property : (USState) -> String) -> [String] {
//        let titles = Set(stateModel.states.map(property))
//        return titles.sorted()
//    }
//
//    func indices(for property : (USState) -> Bool) -> [Int] {
//        let filteredState = stateModel.states.filter(property)
//        let indices = filteredState.map { s in
//            stateModel.states.firstIndex(where: { _s in _s.name == s.name})!
//        }
//        return indices.sorted()
//    }
}
