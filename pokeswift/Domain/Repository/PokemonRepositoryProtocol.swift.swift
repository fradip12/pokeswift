//
//  PokemonRepositoryProtocol.swift.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

protocol PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel]
}
