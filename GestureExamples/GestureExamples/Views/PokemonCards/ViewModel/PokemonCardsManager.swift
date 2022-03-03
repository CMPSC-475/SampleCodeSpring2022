//
//  PokemonCardsManager.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/2/22.
//
import Foundation
import SwiftUI

class Manager :ObservableObject {
    @Published var kept = [Pokemon]()
    @Published var traded = [Pokemon]()
    @Published var pokemons = Pokemon.allPokemons
    
    func keptPokemon(pokemon: Pokemon) {
        kept.append(pokemon)
    }
    func tradedPokemon(pokemon: Pokemon) {
        traded.append(pokemon)
    }
    
    func reset() {
        for i in pokemons.indices {
            pokemons[i].status = .unDecided
        }
        kept.removeAll()
        traded.removeAll()
    }
}
