//
//  PokemonRepositoryImpl.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

struct PokemonRepositoryImpl {
    typealias PokemonInstance = (RemoteDatasource) -> PokemonRepositoryImpl
    
    fileprivate let remote: RemoteDatasource
    
    private init(remote: RemoteDatasource){
        self.remote = remote
    }
    
    static let sharedInstance: PokemonInstance = { remoteRepo in
        return PokemonRepositoryImpl(remote: remoteRepo)
    }
}

extension PokemonRepositoryImpl : PokemonRepositoryProtocol {
    func getPokemons(offset: Int, limit: Int) async throws -> [PokemonEntryModel] {
        do {
            let data = try await remote.getPokemons(offset: offset, limit: limit)
            
            return PokemonMapper.mapPokemonResponseToDomain(input: data.results ?? [])
        } catch {
            throw error
        }
    }
    
    
}
