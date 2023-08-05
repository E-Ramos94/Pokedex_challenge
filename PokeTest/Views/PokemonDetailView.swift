//
//  PokemonDetailView.swift
//  PokeTest
//
//  Created by Enrique Ramos on 20/1/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                PokemonView(pokemon: pokemon)
                
                HStack(alignment: .center, spacing: 15) {
                    Image("weight scale")
                    .frame(width: 24, height: 24)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        // Bold / Bold 14px
                        Text("\(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) Kg")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0, green: 0.26, blue: 0.42))
                        
                        // Regular/Regular 10px
                        Text("Peso")
                          .font(Font.custom("Montserrat", size: 10))
                          .foregroundColor(Color(red: 0.17, green: 0.52, blue: 0.74))
                    }
                    .padding(0)
                    .frame(width: 86, alignment: .topLeading)
                    
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 1, height: 38)
                      .background(Color(red: 0.85, green: 0.85, blue: 0.84))
                    
                    Image("ruler")
                    .frame(width: 24, height: 24)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        // Bold / Bold 14px
                        Text("\(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0, green: 0.26, blue: 0.42))
                        
                        // Regular/Regular 10px
                        Text("Altura")
                          .font(Font.custom("Montserrat", size: 10))
                          .foregroundColor(Color(red: 0.17, green: 0.52, blue: 0.74))
                          .frame(width: 47, alignment: .leading)
                    }
                    .padding(0)
                    .frame(width: 86, alignment: .topLeading)
                    
                    
                }
                .padding(10)
                .frame(width: 345, alignment: .center)
                .background(.white)
                .cornerRadius(10)
                
                // Medium/Body S
                Text(vm.pokemonDescription)
                  .font(
                    Font.custom("Montserrat", size: 12)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                  .frame(width: 345, height: 80, alignment: .leading)
                
                VStack(alignment: .center, spacing: 10) {
                    // Bold/Title S
                    Text("Estadísticas")
                      .font(
                        Font.custom("Montserrat", size: 20)
                          .weight(.bold)
                      )
                      .foregroundColor(Color(red: 0, green: 0.26, blue: 0.42))
                      .frame(width: 344, alignment: .leading)
                    
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("HP")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "hp" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "hp" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("Ataque")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "attack" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "attack" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("Defensa")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "defense" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "defense" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("Ataque especial")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "special-attack" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "special-attack" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("Defensa especial")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "special-defense" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "special-defense" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                    HStack(alignment: .center, spacing: 10) {
                        // Medium/Variant S
                        Text("Velocidad")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                          .frame(width: 121, alignment: .leading)
                        
                        ProgressBar(value: Float(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "speed" })?.base_stat ?? 0) / 100.0, color: vm.getColor())
                                .frame(width: 166)
                        
                        // Bold/Variant M
                        Text("\(vm.pokemonDetails?.stats.first(where: { $0.stat.name == "speed" })?.base_stat ?? 0)")
                          .font(
                            Font.custom("Montserrat", size: 14)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                    }
                    .padding(0)
                    .frame(width: 346, alignment: .leading)
                    
                }
                .padding(0)
            }
            .onAppear {
                vm.getDetails(pokemon: pokemon)
                vm.fetchPokemonDescription(pokemon: pokemon)
            }
            .frame(width: 345, alignment: .top)
        .padding(.bottom, 50)
        }
    }
}

struct ProgressBar: View {
    var value: Float // value is between 0 and 1
    var color: Color

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Rectangle()
                    .foregroundColor(color) // use the color parameter here
                    .frame(width: CGFloat(self.value) * geometry.size.width)
            }
            .cornerRadius(5.0)
        }
        .frame(height: 14)
    }
}



struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
