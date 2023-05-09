//
//  PokemonVM.swift
//  ThePokedex
//
//  Created by CPW on 11/9/22, rebuilt 5/9/23.
//

import SwiftUI

class PokemonVM: ObservableObject
{
    @Published var pokemon = [PokemonData]()
    
    let apiUrl = "https://firebasestorage.googleapis.com/v0/b/pokedex-421b4.appspot.com/o/THIRTYFIVE.json?alt=media&token=a47db0c5-f91c-4714-863f-7f8f7f9710fd"
    
    init()
    {
        fetchPokemonData()
    }
    
    func fetchPokemonData()
    {
        guard let url = URL(string: apiUrl) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url)
        { (data, response, error) in
            guard let cleanData = data?.parseData(removeString: "null,") else { return }
            
            DispatchQueue.main.async
            {
                do
                {
                    let pokemon = try JSONDecoder().decode([PokemonData].self, from: cleanData)
                    self.pokemon = pokemon
                }
                catch
                {
                    print("error msg", error)
                }
            }
        }
        task.resume()
    }
    
    func detectBackgroundColor(forType type: String) -> UIColor
    {
        switch type
        {
        case "NORMAL":
            return UIColor(Color("Normal"))
        case "FIRE":
            return UIColor(Color("Fire"))
        case "WATER":
            return UIColor(Color("Water"))
        case "GRASS":
            return UIColor(Color("Grass"))
        case "ELECTRIC":
            return UIColor(Color("Electric"))
        case "POISON":
            return UIColor(Color("Poison"))
        case "GROUND":
            return UIColor(Color("Ground"))
        case "FLYING":
            return UIColor(Color("Flying"))
        case "BUG":
            return UIColor(Color("Bug"))
        case "FAIRY":
            return UIColor(Color("Fairy"))
        default:
            return .white
        }
    }
}

extension Data
{
    func parseData(removeString string: String) -> Data?
    {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
