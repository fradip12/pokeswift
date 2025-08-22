//
//  GetPokemons.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

protocol GetPokemonsUseCase {
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], Error>
}

struct GetPokemonsUseImpl: GetPokemonsUseCase {
    let repo: PokemonRepositoryProtocol
    
    func execute(offset: Int, limit: Int) async throws -> Result<[PokemonEntryModel], any Error> {
        do {
            let pokemons = try await repo.getPokemons(offset: offset, limit: limit)
            
            return .success(pokemons)
        } catch {
            return .failure(error)
        }
    }
}
