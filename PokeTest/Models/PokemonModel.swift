//
//  PokemonModel.swift
//  PokeTest
//
//  Created by Enrique Ramos on 19/1/23.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let base_experience: Int
    let order: Int
    let stats: [Stats]
}

struct Stats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: Stat
}

struct Stat: Codable {
    let name: String
    let url: String
}

struct PokemonSpecies: Codable {
    
    let color: Color

    struct Color: Codable {
        let name: String
        let url: String
    }
    
    struct Flavor_Text_Entries: Codable {
        let flavor_text: String
        let language: Language
    }
    
    struct Language: Codable {
        let name : String
        let url: String
    }

    let flavor_text_entries: [Flavor_Text_Entries]
}
