//
//  PokemonCard.swift
//  ThePokedex
//
//  Created by CPW on 11/9/22, rebuilt 5/9/23.
//

import SwiftUI
import Kingfisher

struct PokemonCard: View
{
    let pokemonData: PokemonData
    let pokeVM: PokemonVM
    let bgColorOne: Color
    let bgColorTwo: Color
    
    init(pokemonData: PokemonData, pokeVM: PokemonVM) {
        self.pokemonData = pokemonData
        self.pokeVM = pokeVM
        self.bgColorOne = Color(pokeVM.detectBackgroundColor(forType: pokemonData.typeOne.uppercased()))
        self.bgColorTwo = Color(pokeVM.detectBackgroundColor(forType: pokemonData.typeTwo.uppercased()))
    }
    
    var body: some View
    {
        ZStack
        {
            VStack(alignment: .leading)
            {
                Text(pokemonData.name.uppercased())
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.leading)
                
                HStack
                {
                    if pokemonData.typeOne != pokemonData.typeTwo
                    {
                        Text("\(pokemonData.typeOne.uppercased())\n\(pokemonData.typeTwo.uppercased())")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .multilineTextAlignment(.center)
                        
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.25)))
                            .frame(width: 108, height: 48)
                    }
                    else
                    {
                        Text("\(pokemonData.typeOne.uppercased())")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .multilineTextAlignment(.center)
                        
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.25)))
                            .frame(width: 108, height: 48)
                    }
                    
                    KFImage(URL(string: pokemonData.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: bgColorOne, location: 0.5), Gradient.Stop(color: bgColorTwo, location: 0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(12)
        .shadow(color: .black, radius: 1, x: 0, y: 0)
    }
}

/*
struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard()
    }
}
*/
