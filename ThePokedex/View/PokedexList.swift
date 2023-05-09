//
//  PokedexList.swift
//  ThePokedex
//
//  Created by CPW on 11/9/22, rebuilt 5/9/23.
//

import SwiftUI

struct PokedexList: View
{
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonVM()
    
    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                LazyVGrid(columns: gridItems, spacing: 20)
                {
                    ForEach(viewModel.pokemon)
                    { pokemon in
                        NavigationLink(destination: PokemonDetails(pokemonData: pokemon, pokeVM: viewModel))
                        {
                            PokemonCard(pokemonData: pokemon, pokeVM: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
        }
        .tint(.black)
    }
}

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexList()
    }
}
