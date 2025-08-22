//
//  PokemonEntryModel.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

import Foundation

struct PokemonEntryModel : Identifiable {
    var id: UUID = .init()
    let name: String
    let url: String
    
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"

    }
}
