//
//  Pokemon.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/2/22.
//
import Foundation

enum Status : String, Codable {
    case unDecided, kept, traded
}


struct Pokemon : Identifiable, Codable {
    let id : Int
    let name : String
    let types : [PokemonType]
    let height : Double
    let weight : Double
    let weaknesses : [PokemonType]
    let prevEvolution : [Int]?
    let nextEvolution : [Int]?
    var status : Status
    
    var imageName: String {
        String(format: "%03d", id)
    }
    
    static let standard = Pokemon(id: 001, name: "Bulbasaur", types: [.grass,.poison], height: 0.71, weight: 6.9, weaknesses: [.fire,.ice,.flying,.psychic], prevEvolution: nil, nextEvolution: [2,3], status: .unDecided)
    
    static var allPokemons : [Pokemon] {
        let filename = "pokedex"
        let mainBundle = Bundle.main
        let pokemonURL = mainBundle.url(forResource: filename, withExtension: "json")
        let decoder = JSONDecoder()
        var pokemons = [Pokemon]()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let data = try Data(contentsOf: pokemonURL!)
            pokemons = try decoder.decode([Pokemon].self, from: data)
        } catch {
            print(error)
            pokemons = []
        }
        return pokemons
    }
}


enum PokemonType: String, Codable, Identifiable {
    var id: String { self.rawValue }
    
    case bug = "Bug"
    case dragon = "Dragon"
    case electric = "Electric"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case normal = "Normal"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case water = "Water"
}



extension Pokemon{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        types = try values.decode([PokemonType].self, forKey: .types)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        weaknesses = try values.decode([PokemonType].self, forKey: .types)
        prevEvolution = try values.decodeIfPresent([Int].self, forKey: .prevEvolution)
        nextEvolution = try values.decodeIfPresent([Int].self, forKey: .nextEvolution)
        status = .unDecided
    }
}



