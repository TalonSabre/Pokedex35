//
//  PokemonData.swift
//  ThePokedex
//
//  Created by CPW on 11/9/22, rebuilt 5/9/23.
//

import Foundation

struct PokemonData: Decodable, Identifiable
{
    let id: Int
    let name: String
    let imageUrl: String
    let typeOne: String
    let typeTwo: String
    let height: Float   // m
    let weight: Float   // kg
    let description: String
    let hp: Float
    let atk: Float
    let def: Float
    let spatk: Float
    let spdef: Float
    let spe: Float
}
