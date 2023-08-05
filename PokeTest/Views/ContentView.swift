//
//  ContentView.swift
//  PokeTest
//
//  Created by Enrique Ramos on 19/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                CustomNavBar(title: "Pokédex")
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("¡Hola, bienvenido!")
                      .font(
                        Font.custom("Montserrat", size: 20)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0, green: 0.14, blue: 0.23))
                    
                    CustomSearchBar(text: $vm.searchText)

                }
                .padding(0)

                ZStack {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                            ForEach(vm.filteredPokemon) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                    PokemonView(pokemon: pokemon)
                                }.foregroundColor(.black)
                            }
                        }
                        .animation(.easeIn(duration: 0.3), value: vm.filteredPokemon.count)
                    }
                }
            }
            .navigationBarHidden(true) // hides the navigation bar from NavigationView
        }
        .environmentObject(vm)
    }
}


struct CustomNavBar: View {
    var title: String

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            
            HStack(alignment: .center, spacing: 16) {
                Image("Pokemon")
                .frame(width: 46, height: 46)
                
                // Bold/Title M
                Text("Pokédex")
                  .font(
                    Font.custom("Montserrat", size: 24)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0, green: 0.37, blue: 1))
            }
            .padding(0)
        }
        .padding(.leading, 23)
        .padding(.trailing, 195)
        .padding(.top, 10.39999)
        .padding(.bottom, 10.16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
    }
}

struct CustomSearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search...", text: $text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                    if text != "" {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 10)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
