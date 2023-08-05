//
//  ViewModel.swift
//  PokeTest
//
//  Created by Enrique Ramos on 19/1/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var pokemonDescription: String = ""
    @Published var pokemonColor: String = ""
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased()) || $0.id.uuidString.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
        pokemonManager.getPokemon(completion: { pokemon in
                    DispatchQueue.main.async {
                        self.pokemonList = pokemon
                    }
                }, failure: { error in
                    print("Failed to fetch Pokemon with error:", error)
                })
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, base_experience: 0, order: 0, stats: [])
        
        pokemonManager.getDetailPokemon(id: id) { data in
            
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func fetchPokemonDescription(pokemon: Pokemon) {
            let id = getPokemonIndex(pokemon: pokemon)
            
            pokemonManager.getPokemonSpecies(id: id, completion: { pokemonSpecies in
                if let spanishFlavorText = pokemonSpecies.flavor_text_entries.first(where: { $0.language.name == "es" }) {
                    DispatchQueue.main.async {
                        self.pokemonDescription = spanishFlavorText.flavor_text
                        self.pokemonColor = pokemonSpecies.color.name
                    }
                }
            }, failure: { error in
                print("Failed to fetch Pokemon species with error:", error)
            })
        }

    
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10 )
        
        return string
    }
    
    func getColor() -> Color {
        switch pokemonColor {
        case "black":
            return Color.black
        case "red":
            return Color.red
        case "gray":
            return Color.gray
        case "white":
            return Color.white
        case "blue":
            return Color.blue
        case "clear":
            return Color.clear
        case "green":
            return Color.green
        case "primary":
            return Color.primary
        case "accentColor":
            return Color.accentColor
        case "orange":
            return Color.orange
        case "yellow":
            return Color.yellow
        case "secondary":
            return Color.secondary
        case "brown":
            return Color.brown
        case "cyan":
            return Color.cyan
        case "indigo":
            return Color.indigo
        case "mint":
            return Color.mint
        case "pink":
            return Color.pink
        case "purple":
            return Color.purple
        case "teal":
            return Color.teal
        default:
            return Color.gray // or any other default color
        }
    }

    
}
