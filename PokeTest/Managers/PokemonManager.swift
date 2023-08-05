//
//  PokemonManager.swift
//  PokeTest
//
//  Created by Enrique Ramos on 19/1/23.
//

import Foundation

class PokemonManager {
    func getPokemon(completion: @escaping ([Pokemon]) -> (), failure: @escaping (Error) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        Bundle.main.decode(url: url, completion: { (data: PokemonPage) in
            let pokemon: [Pokemon] = data.results
            completion(pokemon)
        }, failure: { error in
            failure(error)
        })
    }
    
    func getDetailPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getPokemonSpecies(id: Int, completion: @escaping (PokemonSpecies) -> (), failure: @escaping (Error) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(id)/") else { return }
        Bundle.main.decode(url: url, completion: { (data: PokemonSpecies) in
            completion(data)
        }, failure: { error in
            failure(error)
        })
    }

}
