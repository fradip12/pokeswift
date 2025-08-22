//
//  Injection.swift
//  pokeswift
//
//  Created by fradip12 on 22/08/25.
//

public final class Injection {
    public static let shared = Injection()
    
    private init() {}
    
    private func providePokemonRepository() -> PokemonRepositoryImpl {
        let remoteDataSource = RemoteDatasource.shared
        return PokemonRepositoryImpl.sharedInstance(remoteDataSource)
    }
    
     func provideGetPokemonUseCase() -> GetPokemonsUseCase {
        let repository = providePokemonRepository()
        return GetPokemonsUseImpl(repo: repository)
    }
}
