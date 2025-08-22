//
//  PokemonEntryResponse.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

struct PokemonResponse: Decodable {
    let count: Int?
    let results: [PokemonEntryResponse]?
}

struct PokemonEntryResponse: Decodable {
    let name: String?
    let url: String?
}


enum PokemonMapper {
    static func mapPokemonResponseToDomain(input response: [PokemonEntryResponse]) -> [PokemonEntryModel] {
        return response.map {
            result in 
                return PokemonEntryModel(
                    name: result.name ?? "Unknown",
                    url: result.url ?? "Unknown"
            )
        }
    }
}
