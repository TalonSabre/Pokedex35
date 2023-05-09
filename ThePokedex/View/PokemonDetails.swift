//
//  PokemonDetails.swift
//  ThePokedex
//
//  Created by CPW on 11/14/22, rebuilt 5/9/23.
//

import SwiftUI
import Kingfisher

struct PokemonDetails: View
{
    let pokemonData: PokemonData
    let pokeVM: PokemonVM
    let backColorOne: Color
    let backColorTwo: Color
    
    init(pokemonData: PokemonData, pokeVM: PokemonVM) {
        self.pokemonData = pokemonData
        self.pokeVM = pokeVM
        self.backColorOne = Color(pokeVM.detectBackgroundColor(forType: pokemonData.typeOne.uppercased()))
        self.backColorTwo = Color(pokeVM.detectBackgroundColor(forType: pokemonData.typeTwo.uppercased()))
    }
    
    var body: some View
    {
        ZStack
        {
            VStack
            {
                HStack(spacing: 0)
                {
                    if pokemonData.typeOne != pokemonData.typeTwo
                    {
                        backColorOne
                            .edgesIgnoringSafeArea(.all)
                        
                        backColorTwo
                            .edgesIgnoringSafeArea(.all)
                    }
                    else
                    {
                        backColorOne
                            .edgesIgnoringSafeArea(.all)
                    }
                }
                
                Color.white
                    .edgesIgnoringSafeArea(.bottom)
            }
            
            ScrollView
            {
                VStack
                {
                    KFImage(URL(string: pokemonData.imageUrl))
                        .resizable()
                        .offset(y: 28)
                        .frame(width: 150, height: 150)
                        .zIndex(1)
                    
                    VStack(alignment: .leading)
                    {
                        VStack(spacing: 15)
                        {
                            Text("#" + String(pokemonData.id))
                                    .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 20)
                            
                            Text(pokemonData.name)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                            
                            HStack
                            {
                                if pokemonData.typeOne != pokemonData.typeTwo
                                {
                                    Text(pokemonData.typeOne)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 152, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(backColorOne))
                                        .backgroundStyle(backColorOne)
                                        .cornerRadius(20)
                                        .shadow(color: .black, radius: 1)
                                    
                                    Text(pokemonData.typeTwo)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 152, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(backColorTwo))
                                        .backgroundStyle(backColorTwo)
                                        .cornerRadius(20)
                                        .shadow(color: .black, radius: 1)
                                }
                                else
                                {
                                    Text(pokemonData.typeOne)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 152, height: 40)
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(backColorOne))
                                        .backgroundStyle(backColorOne)
                                        .cornerRadius(20)
                                        .shadow(color: .black, radius: 1)
                                }
                            }
                            
                            HStack
                            {
                                Spacer()
                                VStack
                                {
                                    HStack(alignment: .center, spacing: 5)
                                    {
                                        Text(String(pokemonData.height))
                                            .font(.title)
                                            .foregroundColor(.black)
                                        
                                        Text("M")
                                            .font(.subheadline)
                                            .fontWeight(.black)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text("Height")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                                VStack
                                {
                                    HStack(alignment: .center, spacing: 5)
                                    {
                                        Text(String(pokemonData.weight))
                                            .font(.title)
                                            .foregroundColor(.black)
                                        
                                        Text("KG")
                                            .font(.subheadline)
                                            .fontWeight(.black)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text("Weight")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            
                            Text(pokemonData.description)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 15)
                        }
                        VStack
                        {
                            HStack
                            {
                                Text("Stats")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 20)
                            }
                            HStack
                            {
                                VStack
                                {
                                    ForEach(0..<6)
                                    { i in
                                        if i == 0
                                        {
                                            StatList(statName: " HP", statVal: pokemonData.hp)
                                        }
                                        else if i == 1
                                        {
                                            StatList(statName: "ATK", statVal: pokemonData.atk)
                                        }
                                        else if i == 2
                                        {
                                            StatList(statName: "DEF", statVal: pokemonData.def)
                                        }
                                        else if i == 3
                                        {
                                            StatList(statName: "SPA", statVal: pokemonData.spatk)
                                        }
                                        else if i == 4
                                        {
                                            StatList(statName: "SPD", statVal: pokemonData.spdef)
                                        }
                                        else if i == 5
                                        {
                                            StatList(statName: "SPE", statVal: pokemonData.spe)
                                        }
                                    }
                                }
                                .padding(.leading, 4)
                                
                                VStack
                                {
                                    ForEach(0..<6)
                                    { i in
                                        if i == 0
                                        {
                                            bars(value: pokemonData.hp / 255, color: backColorOne).frame(height: 12)
                                        }
                                        else if i == 1
                                        {
                                            bars(value: pokemonData.atk / 255, color: backColorOne).frame(height: 12)
                                        }
                                        else if i == 2
                                        {
                                            bars(value: pokemonData.def / 255, color: backColorOne).frame(height: 12)
                                        }
                                        else if i == 3
                                        {
                                            bars(value: pokemonData.spatk / 255, color: backColorOne).frame(height: 12)
                                        }
                                        else if i == 4
                                        {
                                            bars(value: pokemonData.spdef / 255, color: backColorOne).frame(height: 12)
                                        }
                                        else if i == 5
                                        {
                                            bars(value: pokemonData.spe / 255, color: backColorOne).frame(height: 12)
                                        }
                                    }
                                }
                                .padding(.trailing, 16)
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(52)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}

struct bars: View
{
    @State var value: Float
    @State var color: Color
    
    var body: some View
    {
        GeometryReader
        { geo in
            ZStack(alignment: .leading)
            {
                Rectangle().frame(width: geo.size.width, height: geo.size.height)
                    .opacity(0.5)
                    .foregroundColor(Color(.systemGray4))
                
                Rectangle().frame(width: min(CGFloat(self.value) * geo.size.width, geo.size.width), height: geo.size.height)
                    .foregroundColor(color)
                    .animation(.linear)
                    .cornerRadius(44)
            }
            .cornerRadius(44)
        }
    }
}

struct StatList: View
{
    @State var statName: String
    @State var statVal: Float
    
    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(statName.uppercased())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.leading, 12)
                    .padding(.trailing, 8)
                    .monospaced()
            }
            
            VStack(alignment: .trailing)
            {
                Text("\(Int(statVal), specifier: "%3d")")
                    .font(.headline)
                    .monospaced()
            }
        }
    }
}

/*
 struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetails()
    }
 }
 */
