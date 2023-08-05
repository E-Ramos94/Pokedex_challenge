//
//  PokemonView.swift
//  PokeTest
//
//  Created by Enrique Ramos on 20/1/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimension: Double = 210
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimension, height: dimension)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(.white, lineWidth: 1.0).shadow(color: .white, radius: 6))
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension)
            }
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            VStack {
                
                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                    .padding(.bottom, 20)
                
                
            }

        }
    }
}

struct PokeViewTest: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimension: Double = 140
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 265, height: 230.86493)
            .background(
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 265, height: 230.86492919921875)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: dimension, height: dimension)
                }
            )
            
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 345, height: 157)
            .background(Color(red: 0.4, green: 0.83, blue: 0.6))
            .cornerRadius(15)
        }
        .padding(0)
        .frame(width: 348, alignment: .topLeading)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
